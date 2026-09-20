package com.portal.schemes.scheduler;

import com.portal.schemes.repository.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Component
public class DatabaseHealthCheckTask {

    private static final Logger logger = LoggerFactory.getLogger(DatabaseHealthCheckTask.class);

    private final UserRepository userRepository;

    public DatabaseHealthCheckTask(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Scheduled(fixedRate = 300000)
    public void performHealthCheck() {
        try {
            long userCount = userRepository.count();
            logger.debug("Database health check passed at {}. Total users: {}",
                    LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME),
                    userCount);
        } catch (Exception e) {
            logger.error("Database health check failed at {}: {}",
                    LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME),
                    e.getMessage());
        }
    }
}