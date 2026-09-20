package com.portal.schemes.service;

import com.portal.schemes.dto.request.StatusUpdateRequest;
import com.portal.schemes.dto.response.ApplicationTrackingResponse;
import com.portal.schemes.entity.ApplicationTracking;
import com.portal.schemes.entity.Scheme;
import com.portal.schemes.entity.enums.ApplicationStatus;
import com.portal.schemes.exception.ResourceNotFoundException;
import com.portal.schemes.repository.ApplicationTrackingRepository;
import com.portal.schemes.repository.SchemeRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class ApplicationTrackingService {

    private final ApplicationTrackingRepository trackingRepository;
    private final SchemeRepository schemeRepository;
    private final NotificationService notificationService;

    public ApplicationTrackingService(ApplicationTrackingRepository trackingRepository,
                                      SchemeRepository schemeRepository,
                                      NotificationService notificationService) {
        this.trackingRepository = trackingRepository;
        this.schemeRepository = schemeRepository;
        this.notificationService = notificationService;
    }

    @Transactional
    public ApplicationTracking logRedirect(Integer userId, Integer schemeId) {
        if (trackingRepository.existsByUserIdAndSchemeId(userId, schemeId)) {
            throw new RuntimeException("Application already tracked for this scheme");
        }

        ApplicationTracking tracking = ApplicationTracking.builder()
                .userId(userId)
                .schemeId(schemeId)
                .userMarkedStatus(ApplicationStatus.REDIRECTED)
                .reminderSent(false)
                .build();

        return trackingRepository.save(tracking);
    }

    @Transactional
    public ApplicationTrackingResponse updateStatus(Integer trackingId, StatusUpdateRequest request) {
        ApplicationTracking tracking = trackingRepository.findById(trackingId)
                .orElseThrow(() -> new ResourceNotFoundException("Tracking record not found"));

        tracking.setUserMarkedStatus(request.getStatus());
        if (request.getProofDocumentPath() != null) {
            tracking.setProofDocumentPath(request.getProofDocumentPath());
        }

        ApplicationTracking updated = trackingRepository.save(tracking);

        String message = switch (request.getStatus()) {
            case APPLIED -> "Your application status was updated to Applied.";
            case APPROVED -> "🎉 Congratulations! Your application was Approved.";
            case REJECTED -> "Your application was marked Rejected.";
            default -> "Your application status was updated.";
        };

        notificationService.createNotification(tracking.getUserId(), message, "STATUS_UPDATE");

        return mapToResponse(updated);
    }

    public List<ApplicationTrackingResponse> getUserApplications(Integer userId) {
        return trackingRepository.findByUserIdOrderByRedirectedOnDesc(userId)
                .stream()
                .map(this::mapToResponse)
                .collect(Collectors.toList());
    }

    private ApplicationTrackingResponse mapToResponse(ApplicationTracking tracking) {
        Scheme scheme = schemeRepository.findById(tracking.getSchemeId()).orElse(null);

        return ApplicationTrackingResponse.builder()
                .trackingId(tracking.getTrackingId())
                .schemeId(tracking.getSchemeId())
                .schemeName(scheme != null ? scheme.getSchemeName() : "Unknown")
                .department(scheme != null ? scheme.getDepartment() : "")
                .status(tracking.getUserMarkedStatus())
                .redirectedOn(tracking.getRedirectedOn())
                .updatedOn(tracking.getUpdatedOn())
                .proofDocumentPath(tracking.getProofDocumentPath())
                .build();
    }
}