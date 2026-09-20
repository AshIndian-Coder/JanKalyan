package com.portal.schemes.controller;

import com.portal.schemes.dto.response.ApiResponse;
import com.portal.schemes.entity.SchemeSyncLog;
import com.portal.schemes.repository.SchemeSyncLogRepository;
import com.portal.schemes.service.GovDataSyncService;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/admin/sync")
@PreAuthorize("hasAuthority('ADMIN')")
public class SyncController {

    private final GovDataSyncService syncService;
    private final SchemeSyncLogRepository syncLogRepository;

    public SyncController(GovDataSyncService syncService,
                          SchemeSyncLogRepository syncLogRepository) {
        this.syncService = syncService;
        this.syncLogRepository = syncLogRepository;
    }

    @PostMapping("/trigger")
    public ResponseEntity<ApiResponse<String>> triggerManualSync() {
        syncService.syncSchemesFromDataGovIn();
        return ResponseEntity.ok(ApiResponse.success(
                "Sync initiated successfully. Check sync logs for details.",
                "SYNC_TRIGGERED"
        ));
    }

    @GetMapping("/logs")
    public ResponseEntity<ApiResponse<List<SchemeSyncLog>>> getSyncLogs() {
        List<SchemeSyncLog> logs = syncLogRepository.findTop10ByOrderBySyncedOnDesc();
        return ResponseEntity.ok(ApiResponse.success(logs));
    }

    @GetMapping("/logs/all")
    public ResponseEntity<ApiResponse<List<SchemeSyncLog>>> getAllSyncLogs() {
        List<SchemeSyncLog> logs = syncLogRepository.findAll();
        return ResponseEntity.ok(ApiResponse.success(logs));
    }

    @GetMapping("/status")
    public ResponseEntity<ApiResponse<SchemeSyncLog>> getLatestSyncStatus() {
        List<SchemeSyncLog> logs = syncLogRepository.findTop10ByOrderBySyncedOnDesc();
        SchemeSyncLog latestLog = logs.isEmpty() ? null : logs.get(0);

        if (latestLog == null) {
            return ResponseEntity.ok(ApiResponse.error("No sync history found"));
        }

        return ResponseEntity.ok(ApiResponse.success("Latest sync status", latestLog));
    }
}