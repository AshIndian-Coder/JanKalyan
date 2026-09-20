package com.portal.schemes.scheduler;

import com.portal.schemes.entity.Notification;
import com.portal.schemes.repository.NotificationRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Component
public class NotificationCleanupTask {

    private static final Logger logger = LoggerFactory.getLogger(NotificationCleanupTask.class);
    private static final int CLEANUP_THRESHOLD_DAYS = 30;

    private final NotificationRepository notificationRepository;

    public NotificationCleanupTask(NotificationRepository notificationRepository) {
        this.notificationRepository = notificationRepository;
    }

    @Scheduled(cron = "0 0 3 * * SUN")
    @Transactional
    public void cleanupOldReadNotifications() {
        String timestamp = LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME);
        logger.info("Starting notification cleanup at {}", timestamp);

        LocalDateTime thresholdDate = LocalDateTime.now().minusDays(CLEANUP_THRESHOLD_DAYS);

        List<Notification> oldNotifications = notificationRepository.findAll().stream()
                .filter(n -> n.getIsRead() && n.getCreatedAt().isBefore(thresholdDate))
                .toList();

        int deletedCount = oldNotifications.size();

        if (deletedCount > 0) {
            notificationRepository.deleteAll(oldNotifications);
            logger.info("Deleted {} old read notifications at {}",
                    deletedCount,
                    LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME));
        } else {
            logger.info("No old notifications to clean up at {}",
                    LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME));
        }
    }
}