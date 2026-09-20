package com.portal.schemes.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.portal.schemes.entity.Scheme;
import com.portal.schemes.entity.SchemeSyncLog;
import com.portal.schemes.entity.enums.SchemeLevel;
import com.portal.schemes.entity.enums.SourceType;
import com.portal.schemes.repository.SchemeSyncLogRepository;
import com.portal.schemes.repository.SchemeRepository;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

@Service
public class GovDataSyncService {

    @Value("${datagovin.api.key:}")
    private String apiKey;

    @Value("${datagovin.resource.id:}")
    private String resourceId;

    private final RestTemplate restTemplate;
    private final SchemeRepository schemeRepository;
    private final SchemeSyncLogRepository syncLogRepository;
    private final ObjectMapper objectMapper;

    public GovDataSyncService(SchemeRepository schemeRepository,
                              SchemeSyncLogRepository syncLogRepository) {
        this.schemeRepository = schemeRepository;
        this.syncLogRepository = syncLogRepository;
        this.restTemplate = new RestTemplate();
        this.objectMapper = new ObjectMapper();
    }

    @Transactional
    public void syncSchemesFromDataGovIn() {
        if (apiKey == null || apiKey.isEmpty() || resourceId == null || resourceId.isEmpty()) {
            logSync("data.gov.in", 0, "SKIPPED: API key or resource ID not configured");
            return;
        }

        String url = String.format(
                "https://api.data.gov.in/resource/%s?api-key=%s&format=json&limit=100",
                resourceId, apiKey
        );

        int recordsFetched = 0;
        String status = "SUCCESS";

        try {
            String response = restTemplate.getForObject(url, String.class);
            JsonNode root = objectMapper.readTree(response);
            JsonNode records = root.get("records");

            if (records != null && records.isArray()) {
                for (JsonNode record : records) {
                    Scheme scheme = mapJsonToScheme(record);
                    schemeRepository.save(scheme);
                    recordsFetched++;
                }
            }

        } catch (Exception e) {
            status = "FAILED: " + e.getMessage();
        }

        logSync("data.gov.in", recordsFetched, status);
    }

    private Scheme mapJsonToScheme(JsonNode record) {
        return Scheme.builder()
                .schemeName(record.path("scheme_name").asText("Unnamed Scheme"))
                .description(record.path("description").asText())
                .department(record.path("ministry").asText())
                .level(SchemeLevel.CENTRAL)
                .category(record.path("category").asText("General"))
                .source(SourceType.DATA_GOV_IN)
                .isActive(true)
                .build();
    }

    private void logSync(String sourceName, int recordsFetched, String status) {
        SchemeSyncLog log = SchemeSyncLog.builder()
                .sourceName(sourceName)
                .recordsFetched(recordsFetched)
                .status(status)
                .build();
        syncLogRepository.save(log);
    }
}