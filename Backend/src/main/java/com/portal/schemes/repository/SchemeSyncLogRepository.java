package com.portal.schemes.repository;

import com.portal.schemes.entity.SchemeSyncLog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SchemeSyncLogRepository extends JpaRepository<SchemeSyncLog, Integer> {
    List<SchemeSyncLog> findTop10ByOrderBySyncedOnDesc();
}