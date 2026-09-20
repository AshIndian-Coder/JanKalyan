package com.portal.schemes.dto.response;

import com.portal.schemes.entity.enums.ApplicationStatus;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ApplicationTrackingResponse {

    private Integer trackingId;
    private Integer schemeId;
    private String schemeName;
    private String department;
    private ApplicationStatus status;
    private LocalDateTime redirectedOn;
    private LocalDateTime updatedOn;
    private String proofDocumentPath;
}