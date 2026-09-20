package com.portal.schemes.dto.request;

import com.portal.schemes.entity.enums.CasteCategory;
import com.portal.schemes.entity.enums.Gender;
import com.portal.schemes.entity.enums.MaritalStatus;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProfileUpdateRequest {

    private LocalDate dateOfBirth;
    private Gender gender;
    private String state;
    private String district;
    private BigDecimal annualIncome;
    private CasteCategory casteCategory;
    private String occupation;
    private String educationLevel;
    private Boolean isBpl;
    private Boolean disabilityStatus;
    private MaritalStatus maritalStatus;
    private BigDecimal landHoldingAcres;
}