package com.portal.schemes.scheduler;

import com.portal.schemes.service.GovDataSyncService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Component
public class ScheduledSyncTask {

    private static final Logger logger = LoggerFactory.getLogger(ScheduledSyncTask.class);
    private final GovDataSyncService syncService;

    public ScheduledSyncTask(GovDataSyncService syncService) {
        this.syncService = syncService;
    }

    @Scheduled(cron = "0 0 2 * * ?")
    public void runDailySync() {
        String timestamp = LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME);
        logger.info("Starting scheduled scheme sync at {}", timestamp);

        try {
            syncService.syncSchemesFromDataGovIn();
            logger.info("Scheduled sync completed successfully at {}",
                    LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME));
        } catch (Exception e) {
            logger.error("Scheduled sync failed at {}: {}",
                    LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME),
                    e.getMessage());
        }
    }

    @Scheduled(cron = "0 0 14 * * ?")
    public void runAfternoonSync() {
        String timestamp = LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME);
        logger.info("Starting afternoon sync check at {}", timestamp);

        try {
            syncService.syncSchemesFromDataGovIn();
            logger.info("Afternoon sync completed successfully at {}",
                    LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME));
        } catch (Exception e) {
            logger.error("Afternoon sync failed at {}: {}",
                    LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME),
                    e.getMessage());
        }
    }
}