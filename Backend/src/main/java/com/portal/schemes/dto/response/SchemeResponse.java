package com.portal.schemes.dto.response;

import com.portal.schemes.entity.enums.SchemeLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SchemeResponse {

    private Integer schemeId;
    private String schemeName;
    private String description;
    private String department;
    private SchemeLevel level;
    private String state;
    private String category;
    private String officialApplyUrl;
    private String officialStatusCheckUrl;
    private List<String> documents;
    private List<String> benefits;
    private List<CriteriaResponse> criteria;
}