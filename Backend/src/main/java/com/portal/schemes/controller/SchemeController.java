package com.portal.schemes.controller;

import com.portal.schemes.dto.response.ApiResponse;
import com.portal.schemes.dto.response.SchemeResponse;
import com.portal.schemes.service.SchemeService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/schemes")
public class SchemeController {

    private final SchemeService schemeService;

    public SchemeController(SchemeService schemeService) {
        this.schemeService = schemeService;
    }

    @GetMapping
    public ResponseEntity<ApiResponse<List<SchemeResponse>>> getAllSchemes() {
        List<SchemeResponse> schemes = schemeService.getAllActiveSchemes();
        return ResponseEntity.ok(ApiResponse.success(schemes));
    }

    @GetMapping("/{schemeId}")
    public ResponseEntity<ApiResponse<SchemeResponse>> getSchemeById(@PathVariable Integer schemeId) {
        SchemeResponse scheme = schemeService.getSchemeById(schemeId);
        return ResponseEntity.ok(ApiResponse.success(scheme));
    }

    @GetMapping("/category/{category}")
    public ResponseEntity<ApiResponse<List<SchemeResponse>>> getSchemesByCategory(
            @PathVariable String category) {

        List<SchemeResponse> schemes = schemeService.getSchemesByCategory(category);
        return ResponseEntity.ok(ApiResponse.success(schemes));
    }

    @GetMapping("/search")
    public ResponseEntity<ApiResponse<List<SchemeResponse>>> searchSchemes(
            @RequestParam(required = false) String category,
            @RequestParam(required = false) String state) {

        if (category != null && !category.isEmpty()) {
            return ResponseEntity.ok(ApiResponse.success(schemeService.getSchemesByCategory(category)));
        }

        return ResponseEntity.ok(ApiResponse.success(schemeService.getAllActiveSchemes()));
    }
}