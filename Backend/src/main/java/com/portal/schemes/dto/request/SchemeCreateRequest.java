package com.portal.schemes.dto.request;

import com.portal.schemes.entity.enums.SchemeLevel;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SchemeCreateRequest {

    @NotBlank(message = "Scheme name is required")
    @Size(max = 150, message = "Scheme name cannot exceed 150 characters")
    private String schemeName;

    private String description;

    private String department;

    private SchemeLevel level;

    private String state;

    private String category;

    private String officialApplyUrl;

    private String officialStatusCheckUrl;

    @Valid
    private List<CriteriaDto> criteriaList;

    @Valid
    private List<DocumentDto> documentList;

    @Valid
    private List<BenefitDto> benefitList;
}