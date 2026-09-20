package com.portal.schemes.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "scheme_eligibility_criteria")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SchemeEligibilityCriteria {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "criteria_id")
    private Integer criteriaId;

    @Column(name = "scheme_id", nullable = false)
    private Integer schemeId;

    @Column(name = "field_name", nullable = false, length = 50)
    private String fieldName;

    @Column(name = "operator", nullable = false, length = 20)
    private String operator;

    @Column(name = "value", nullable = false)
    private String value;

    @Column(name = "value2")
    private String value2;
}