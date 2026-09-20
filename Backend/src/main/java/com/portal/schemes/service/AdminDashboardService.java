package com.portal.schemes.service;

import com.portal.schemes.dto.response.DashboardStatsResponse;
import com.portal.schemes.entity.enums.ApplicationStatus;
import com.portal.schemes.repository.*;
import org.springframework.stereotype.Service;

@Service
public class AdminDashboardService {

    private final UserRepository userRepository;
    private final SchemeRepository schemeRepository;
    private final ApplicationTrackingRepository applicationTrackingRepository;

    public AdminDashboardService(UserRepository userRepository,
                                 SchemeRepository schemeRepository,
                                 ApplicationTrackingRepository applicationTrackingRepository) {
        this.userRepository = userRepository;
        this.schemeRepository = schemeRepository;
        this.applicationTrackingRepository = applicationTrackingRepository;
    }

    public DashboardStatsResponse getDashboardStats() {
        long totalUsers = userRepository.count();
        long totalSchemes = schemeRepository.count();
        long activeSchemes = schemeRepository.findByIsActiveTrue().size();
        long totalApplications = applicationTrackingRepository.count();
        long approvedApplications = applicationTrackingRepository
                .findByUserMarkedStatusAndReminderSentFalseAndRedirectedOnBefore(
                        ApplicationStatus.APPROVED,
                        java.time.LocalDateTime.now()
                ).size();

        return DashboardStatsResponse.builder()
                .totalUsers(totalUsers)
                .totalSchemes(totalSchemes)
                .activeSchemes(activeSchemes)
                .totalApplications(totalApplications)
                .approvedApplications(approvedApplications)
                .build();
    }
}
