package com.portal.schemes.controller;

import com.portal.schemes.dto.request.ProfileUpdateRequest;
import com.portal.schemes.dto.response.ApiResponse;
import com.portal.schemes.dto.response.UserProfileResponse;
import com.portal.schemes.service.UserProfileService;
import com.portal.schemes.util.JwtUtil;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/profile")
public class UserProfileController {

    private final UserProfileService userProfileService;
    private final JwtUtil jwtUtil;

    public UserProfileController(UserProfileService userProfileService, JwtUtil jwtUtil) {
        this.userProfileService = userProfileService;
        this.jwtUtil = jwtUtil;
    }

    @GetMapping("/{userId}")
    public ResponseEntity<ApiResponse<UserProfileResponse>> getProfile(@PathVariable Integer userId) {
        UserProfileResponse profile = userProfileService.getProfileByUserId(userId);
        return ResponseEntity.ok(ApiResponse.success(profile));
    }

    @GetMapping("/me")
    public ResponseEntity<ApiResponse<UserProfileResponse>> getMyProfile(
            @RequestHeader("Authorization") String authHeader) {

        String token = authHeader.substring(7);
        Integer userId = jwtUtil.getUserIdFromToken(token);

        UserProfileResponse profile = userProfileService.getProfileByUserId(userId);
        return ResponseEntity.ok(ApiResponse.success(profile));
    }

    @PutMapping("/{userId}")
    public ResponseEntity<ApiResponse<UserProfileResponse>> updateProfile(
            @PathVariable Integer userId,
            @Valid @RequestBody ProfileUpdateRequest request) {

        UserProfileResponse updatedProfile = userProfileService.createOrUpdateProfile(userId, request);
        return ResponseEntity.ok(ApiResponse.success("Profile updated successfully", updatedProfile));
    }

    @PostMapping("/{userId}")
    public ResponseEntity<ApiResponse<UserProfileResponse>> createProfile(
            @PathVariable Integer userId,
            @Valid @RequestBody ProfileUpdateRequest request) {

        UserProfileResponse profile = userProfileService.createOrUpdateProfile(userId, request);
        return ResponseEntity.ok(ApiResponse.success("Profile created successfully", profile));
    }
}