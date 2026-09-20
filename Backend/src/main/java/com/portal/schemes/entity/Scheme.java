package com.portal.schemes.entity;

import com.portal.schemes.entity.enums.SchemeLevel;
import com.portal.schemes.entity.enums.SourceType;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.LocalDateTime;

@Entity
@Table(name = "schemes")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Scheme {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "scheme_id")
    private Integer schemeId;

    @Column(name = "scheme_name", nullable = false, length = 150)
    private String schemeName;

    @Column(name = "description", columnDefinition = "TEXT")
    private String description;

    @Column(name = "department", length = 100)
    private String department;

    @Enumerated(EnumType.STRING)
    @Column(name = "level")
    @Builder.Default
    private SchemeLevel level = SchemeLevel.CENTRAL;

    @Column(name = "state", length = 50)
    private String state;

    @Column(name = "category", length = 50)
    private String category;

    @Column(name = "official_apply_url", length = 500)
    private String officialApplyUrl;

    @Column(name = "official_status_check_url", length = 500)
    private String officialStatusCheckUrl;

    @Column(name = "is_active")
    @Builder.Default
    private Boolean isActive = true;

    @Enumerated(EnumType.STRING)
    @Column(name = "source")
    @Builder.Default
    private SourceType source = SourceType.MANUAL;

    @CreationTimestamp
    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt;

    @UpdateTimestamp
    @Column(name = "updated_at")
    private LocalDateTime updatedAt;
}