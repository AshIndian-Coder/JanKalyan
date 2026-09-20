package com.portal.schemes.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDateTime;

@Entity
@Table(name = "scheme_sync_log")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SchemeSyncLog {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "sync_id")
    private Integer syncId;

    @Column(name = "source_name", length = 100)
    private String sourceName;

    @CreationTimestamp
    @Column(name = "synced_on", updatable = false)
    private LocalDateTime syncedOn;

    @Column(name = "records_fetched")
    private Integer recordsFetched;

    @Column(name = "status")
    private String status;
}