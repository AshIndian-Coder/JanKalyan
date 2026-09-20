package com.portal.schemes.scheduler;

import com.portal.schemes.repository.ApplicationTrackingRepository;
import com.portal.schemes.repository.SchemeRepository;
import com.portal.schemes.repository.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Component
public class StatsRefreshTask {

    private static final Logger logger = LoggerFactory.getLogger(StatsRefreshTask.class);

    private final UserRepository userRepository;
    private final SchemeRepository schemeRepository;
    private final ApplicationTrackingRepository applicationTrackingRepository;

    public StatsRefreshTask(UserRepository userRepository,
                            SchemeRepository schemeRepository,
                            ApplicationTrackingRepository applicationTrackingRepository) {
        this.userRepository = userRepository;
        this.schemeRepository = schemeRepository;
        this.applicationTrackingRepository = applicationTrackingRepository;
    }

    @Scheduled(cron = "0 */30 * * * ?")
    @CacheEvict(value = "dashboardStats", allEntries = true)
    public void refreshDashboardStats() {
        String timestamp = LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME);
        logger.debug("Refreshing dashboard statistics at {}", timestamp);

        try {
            long totalUsers = userRepository.count();
            long totalSchemes = schemeRepository.count();
            long totalApplications = applicationTrackingRepository.count();

            logger.info("Dashboard stats refreshed at {}: Users={}, Schemes={}, Applications={}",
                    LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME),
                    totalUsers,
                    totalSchemes,
                    totalApplications);

        } catch (Exception e) {
            logger.error("Failed to refresh dashboard stats at {}: {}",
                    LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME),
                    e.getMessage());
        }
    }
}