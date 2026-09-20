package com.portal.schemes.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "scheme_benefits")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SchemeBenefit {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "benefit_id")
    private Integer benefitId;

    @Column(name = "scheme_id", nullable = false)
    private Integer schemeId;

    @Column(name = "benefit_description")
    private String benefitDescription;
}