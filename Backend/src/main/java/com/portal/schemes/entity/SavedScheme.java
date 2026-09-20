package com.portal.schemes.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDateTime;

@Entity
@Table(name = "saved_schemes", uniqueConstraints = {
        @UniqueConstraint(columnNames = {"user_id", "scheme_id"})
})
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SavedScheme {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "bookmark_id")
    private Integer bookmarkId;

    @Column(name = "user_id", nullable = false)
    private Integer userId;

    @Column(name = "scheme_id", nullable = false)
    private Integer schemeId;

    @CreationTimestamp
    @Column(name = "saved_on", updatable = false)
    private LocalDateTime savedOn;
}