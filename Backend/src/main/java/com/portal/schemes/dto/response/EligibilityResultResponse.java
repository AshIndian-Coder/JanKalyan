package com.portal.schemes.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class EligibilityResultResponse {

    private Integer schemeId;
    private String schemeName;
    private String department;
    private String category;
    private String description;
    private Integer matchPercentage;
    private String officialApplyUrl;
    private List<String> benefits;
    private List<String> requiredDocuments;
}