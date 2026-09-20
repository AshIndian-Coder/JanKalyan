package com.portal.schemes.entity;

import com.portal.schemes.entity.enums.CasteCategory;
import com.portal.schemes.entity.enums.Gender;
import com.portal.schemes.entity.enums.MaritalStatus;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.UpdateTimestamp;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "user_profiles")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserProfile {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "profile_id")
    private Integer profileId;

    @Column(name = "user_id", unique = true, nullable = false)
    private Integer userId;

    @Column(name = "date_of_birth")
    private LocalDate dateOfBirth;

    @Enumerated(EnumType.STRING)
    @Column(name = "gender")
    private Gender gender;

    @Column(name = "state", length = 50)
    private String state;

    @Column(name = "district", length = 50)
    private String district;

    @Column(name = "annual_income", precision = 12, scale = 2)
    private BigDecimal annualIncome;

    @Enumerated(EnumType.STRING)
    @Column(name = "caste_category")
    private CasteCategory casteCategory;

    @Column(name = "occupation", length = 50)
    private String occupation;

    @Column(name = "education_level", length = 50)
    private String educationLevel;

    @Column(name = "is_bpl")
    @Builder.Default
    private Boolean isBpl = false;

    @Column(name = "disability_status")
    @Builder.Default
    private Boolean disabilityStatus = false;

    @Enumerated(EnumType.STRING)
    @Column(name = "marital_status")
    private MaritalStatus maritalStatus;

    @Column(name = "land_holding_acres", precision = 6, scale = 2)
    @Builder.Default
    private BigDecimal landHoldingAcres = BigDecimal.ZERO;

    @UpdateTimestamp
    @Column(name = "updated_at")
    private LocalDateTime updatedAt;
}