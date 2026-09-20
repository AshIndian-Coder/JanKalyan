package com.portal.schemes.controller;

import com.portal.schemes.dto.request.StatusUpdateRequest;
import com.portal.schemes.dto.response.ApiResponse;
import com.portal.schemes.dto.response.ApplicationTrackingResponse;
import com.portal.schemes.entity.ApplicationTracking;
import com.portal.schemes.service.ApplicationTrackingService;
import com.portal.schemes.util.JwtUtil;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/apply")
public class ApplicationTrackingController {

    private final ApplicationTrackingService applicationTrackingService;
    private final JwtUtil jwtUtil;

    public ApplicationTrackingController(ApplicationTrackingService applicationTrackingService,
                                         JwtUtil jwtUtil) {
        this.applicationTrackingService = applicationTrackingService;
        this.jwtUtil = jwtUtil;
    }

    @PostMapping("/redirect/{schemeId}")
    public ResponseEntity<ApiResponse<Map<String, Object>>> redirectToApply(
            @PathVariable Integer schemeId,
            @RequestParam Integer userId) {

        ApplicationTracking tracking = applicationTrackingService.logRedirect(userId, schemeId);

        Map<String, Object> response = Map.of(
                "trackingId", tracking.getTrackingId(),
                "message", "Redirect logged successfully"
        );

        return ResponseEntity
                .status(HttpStatus.CREATED)
                .body(ApiResponse.success("Application tracking initiated", response));
    }

    @PutMapping("/status/{trackingId}")
    public ResponseEntity<ApiResponse<ApplicationTrackingResponse>> updateStatus(
            @PathVariable Integer trackingId,
            @Valid @RequestBody StatusUpdateRequest request) {

        ApplicationTrackingResponse updated = applicationTrackingService.updateStatus(trackingId, request);
        return ResponseEntity.ok(ApiResponse.success("Status updated successfully", updated));
    }

    @GetMapping("/user/{userId}")
    public ResponseEntity<ApiResponse<List<ApplicationTrackingResponse>>> getUserApplications(
            @PathVariable Integer userId) {

        List<ApplicationTrackingResponse> applications = applicationTrackingService.getUserApplications(userId);
        return ResponseEntity.ok(ApiResponse.success(applications));
    }

    @GetMapping("/my-applications")
    public ResponseEntity<ApiResponse<List<ApplicationTrackingResponse>>> getMyApplications(
            @RequestHeader("Authorization") String authHeader) {

        String token = authHeader.substring(7);
        Integer userId = jwtUtil.getUserIdFromToken(token);

        List<ApplicationTrackingResponse> applications = applicationTrackingService.getUserApplications(userId);
        return ResponseEntity.ok(ApiResponse.success(applications));
    }
}