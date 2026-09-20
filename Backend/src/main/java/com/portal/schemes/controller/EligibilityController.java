package com.portal.schemes.controller;

import com.portal.schemes.dto.response.ApiResponse;
import com.portal.schemes.dto.response.EligibilityResultResponse;
import com.portal.schemes.service.EligibilityEngineService;
import com.portal.schemes.util.JwtUtil;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/eligibility")
public class EligibilityController {

    private final EligibilityEngineService eligibilityEngineService;
    private final JwtUtil jwtUtil;

    public EligibilityController(EligibilityEngineService eligibilityEngineService, JwtUtil jwtUtil) {
        this.eligibilityEngineService = eligibilityEngineService;
        this.jwtUtil = jwtUtil;
    }

    @PostMapping("/check/{userId}")
    public ResponseEntity<ApiResponse<List<EligibilityResultResponse>>> checkEligibility(
            @PathVariable Integer userId) {

        List<EligibilityResultResponse> results = eligibilityEngineService.checkEligibility(userId);

        String message = results.isEmpty()
                ? "No matching schemes found based on your profile"
                : String.format("Found %d matching schemes", results.size());

        return ResponseEntity.ok(ApiResponse.success(message, results));
    }

    @PostMapping("/check/me")
    public ResponseEntity<ApiResponse<List<EligibilityResultResponse>>> checkMyEligibility(
            @RequestHeader("Authorization") String authHeader) {

        String token = authHeader.substring(7);
        Integer userId = jwtUtil.getUserIdFromToken(token);

        List<EligibilityResultResponse> results = eligibilityEngineService.checkEligibility(userId);

        String message = results.isEmpty()
                ? "No matching schemes found based on your profile"
                : String.format("Found %d matching schemes", results.size());

        return ResponseEntity.ok(ApiResponse.success(message, results));
    }
}