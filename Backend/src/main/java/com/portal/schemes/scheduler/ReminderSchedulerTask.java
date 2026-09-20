package com.portal.schemes.scheduler;

import com.portal.schemes.entity.ApplicationTracking;
import com.portal.schemes.entity.enums.ApplicationStatus;
import com.portal.schemes.repository.ApplicationTrackingRepository;
import com.portal.schemes.service.NotificationService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Component
public class ReminderSchedulerTask {

    private static final Logger logger = LoggerFactory.getLogger(ReminderSchedulerTask.class);
    private static final int REMINDER_THRESHOLD_DAYS = 5;

    private final ApplicationTrackingRepository trackingRepository;
    private final NotificationService notificationService;

    public ReminderSchedulerTask(ApplicationTrackingRepository trackingRepository,
                                 NotificationService notificationService) {
        this.trackingRepository = trackingRepository;
        this.notificationService = notificationService;
    }

    @Scheduled(cron = "0 0 9 * * ?")
    @Transactional
    public void sendPendingApplicationReminders() {
        String timestamp = LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME);
        logger.info("Starting reminder check at {}", timestamp);

        LocalDateTime thresholdDate = LocalDateTime.now().minusDays(REMINDER_THRESHOLD_DAYS);

        List<ApplicationTracking> staleRedirects = trackingRepository
                .findByUserMarkedStatusAndReminderSentFalseAndRedirectedOnBefore(
                        ApplicationStatus.REDIRECTED,
                        thresholdDate
                );

        int remindersSent = 0;

        for (ApplicationTracking tracking : staleRedirects) {
            try {
                String message = String.format(
                        "You started an application %d days ago. Have you completed it on the official portal?",
                        REMINDER_THRESHOLD_DAYS
                );

                notificationService.createNotification(
                        tracking.getUserId(),
                        message,
                        "REMINDER"
                );

                tracking.setReminderSent(true);
                trackingRepository.save(tracking);
                remindersSent++;

            } catch (Exception e) {
                logger.error("Failed to send reminder for tracking ID {}: {}",
                        tracking.getTrackingId(),
                        e.getMessage());
            }
        }

        logger.info("Reminder check completed at {}. Sent {} reminders.",
                LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME),
                remindersSent);
    }

    @Scheduled(cron = "0 0 18 * * ?")
    @Transactional
    public void sendEveningReminders() {
        String timestamp = LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME);
        logger.info("Starting evening reminder check at {}", timestamp);

        LocalDateTime oneDayAgo = LocalDateTime.now().minusDays(1);

        List<ApplicationTracking> recentRedirects = trackingRepository
                .findByUserMarkedStatusAndReminderSentFalseAndRedirectedOnBefore(
                        ApplicationStatus.REDIRECTED,
                        oneDayAgo
                );

        int remindersSent = 0;

        for (ApplicationTracking tracking : recentRedirects) {
            try {
                String message = "Don't forget to complete your application on the official portal!";

                notificationService.createNotification(
                        tracking.getUserId(),
                        message,
                        "REMINDER"
                );

                remindersSent++;

            } catch (Exception e) {
                logger.error("Failed to send evening reminder for tracking ID {}: {}",
                        tracking.getTrackingId(),
                        e.getMessage());
            }
        }

        logger.info("Evening reminder check completed at {}. Sent {} reminders.",
                LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME),
                remindersSent);
    }
}