package com.portal.schemes.entity;

import com.portal.schemes.entity.enums.ApplicationStatus;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.LocalDateTime;

@Entity
@Table(name = "application_tracking")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ApplicationTracking {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "tracking_id")
    private Integer trackingId;

    @Column(name = "user_id", nullable = false)
    private Integer userId;

    @Column(name = "scheme_id", nullable = false)
    private Integer schemeId;

    @CreationTimestamp
    @Column(name = "redirected_on", updatable = false)
    private LocalDateTime redirectedOn;

    @Enumerated(EnumType.STRING)
    @Column(name = "user_marked_status")
    @Builder.Default
    private ApplicationStatus userMarkedStatus = ApplicationStatus.REDIRECTED;

    @Column(name = "proof_document_path", length = 300)
    private String proofDocumentPath;

    @Column(name = "reminder_sent")
    @Builder.Default
    private Boolean reminderSent = false;

    @UpdateTimestamp
    @Column(name = "updated_on")
    private LocalDateTime updatedOn;
}