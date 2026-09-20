package com.portal.schemes.repository;

import com.portal.schemes.entity.ApplicationTracking;
import com.portal.schemes.entity.enums.ApplicationStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface ApplicationTrackingRepository extends JpaRepository<ApplicationTracking, Integer> {
    List<ApplicationTracking> findByUserId(Integer userId);
    List<ApplicationTracking> findByUserIdOrderByRedirectedOnDesc(Integer userId);
    List<ApplicationTracking> findByUserMarkedStatusAndReminderSentFalseAndRedirectedOnBefore(
            ApplicationStatus status, LocalDateTime before);
    boolean existsByUserIdAndSchemeId(Integer userId, Integer schemeId);
}