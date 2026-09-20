package com.portal.schemes.controller;

import com.portal.schemes.dto.response.ApiResponse;
import com.portal.schemes.dto.response.SchemeResponse;
import com.portal.schemes.entity.SavedScheme;
import com.portal.schemes.service.SavedSchemeService;
import com.portal.schemes.util.JwtUtil;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/saved")
public class SavedSchemeController {

    private final SavedSchemeService savedSchemeService;
    private final JwtUtil jwtUtil;

    public SavedSchemeController(SavedSchemeService savedSchemeService, JwtUtil jwtUtil) {
        this.savedSchemeService = savedSchemeService;
        this.jwtUtil = jwtUtil;
    }

    @PostMapping("/{schemeId}")
    public ResponseEntity<ApiResponse<SavedScheme>> saveScheme(
            @PathVariable Integer schemeId,
            @RequestParam Integer userId) {

        SavedScheme saved = savedSchemeService.saveScheme(userId, schemeId);
        return ResponseEntity
                .status(HttpStatus.CREATED)
                .body(ApiResponse.success("Scheme saved successfully", saved));
    }

    @DeleteMapping("/{schemeId}")
    public ResponseEntity<ApiResponse<String>> unsaveScheme(
            @PathVariable Integer schemeId,
            @RequestParam Integer userId) {

        savedSchemeService.unsaveScheme(userId, schemeId);
        return ResponseEntity.ok(ApiResponse.success("Scheme removed from saved list", "DELETED"));
    }

    @GetMapping("/user/{userId}")
    public ResponseEntity<ApiResponse<List<SchemeResponse>>> getSavedSchemes(@PathVariable Integer userId) {
        List<SchemeResponse> savedSchemes = savedSchemeService.getSavedSchemesByUser(userId);
        return ResponseEntity.ok(ApiResponse.success(savedSchemes));
    }

    @GetMapping("/my-saved")
    public ResponseEntity<ApiResponse<List<SchemeResponse>>> getMySavedSchemes(
            @RequestHeader("Authorization") String authHeader) {

        String token = authHeader.substring(7);
        Integer userId = jwtUtil.getUserIdFromToken(token);

        List<SchemeResponse> savedSchemes = savedSchemeService.getSavedSchemesByUser(userId);
        return ResponseEntity.ok(ApiResponse.success(savedSchemes));
    }

    @GetMapping("/check/{schemeId}")
    public ResponseEntity<ApiResponse<Map<String, Boolean>>> checkIfSaved(
            @PathVariable Integer schemeId,
            @RequestParam Integer userId) {

        boolean isSaved = savedSchemeService.isSaved(userId, schemeId);
        return ResponseEntity.ok(ApiResponse.success(Map.of("isSaved", isSaved)));
    }
}