package com.portal.schemes.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CriteriaResponse {

    private String fieldName;
    private String operator;
    private String value;
    private String value2;
}