package com.portal.schemes.dto.request;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CriteriaDto {

    @NotBlank(message = "Field name is required")
    private String fieldName;

    @NotBlank(message = "Operator is required")
    private String operator;

    @NotBlank(message = "Value is required")
    private String value;

    private String value2;
}