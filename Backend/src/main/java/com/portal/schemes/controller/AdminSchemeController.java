package com.portal.schemes.controller;

import com.portal.schemes.dto.request.SchemeCreateRequest;
import com.portal.schemes.dto.response.ApiResponse;
import com.portal.schemes.dto.response.SchemeResponse;
import com.portal.schemes.service.SchemeService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/admin/schemes")
@PreAuthorize("hasAuthority('ADMIN')")
public class AdminSchemeController {

    private final SchemeService schemeService;

    public AdminSchemeController(SchemeService schemeService) {
        this.schemeService = schemeService;
    }

    @PostMapping
    public ResponseEntity<ApiResponse<SchemeResponse>> createScheme(
            @Valid @RequestBody SchemeCreateRequest request) {

        SchemeResponse scheme = schemeService.createScheme(request);
        return ResponseEntity
                .status(HttpStatus.CREATED)
                .body(ApiResponse.success("Scheme created successfully", scheme));
    }

    @PutMapping("/{schemeId}")
    public ResponseEntity<ApiResponse<SchemeResponse>> updateScheme(
            @PathVariable Integer schemeId,
            @Valid @RequestBody SchemeCreateRequest request) {

        SchemeResponse scheme = schemeService.updateScheme(schemeId, request);
        return ResponseEntity.ok(ApiResponse.success("Scheme updated successfully", scheme));
    }

    @DeleteMapping("/{schemeId}")
    public ResponseEntity<ApiResponse<String>> deleteScheme(@PathVariable Integer schemeId) {
        schemeService.deleteScheme(schemeId);
        return ResponseEntity.ok(ApiResponse.success("Scheme deactivated successfully", "DELETED"));
    }

    @GetMapping("/{schemeId}")
    public ResponseEntity<ApiResponse<SchemeResponse>> getSchemeDetails(@PathVariable Integer schemeId) {
        SchemeResponse scheme = schemeService.getSchemeById(schemeId);
        return ResponseEntity.ok(ApiResponse.success(scheme));
    }
}
