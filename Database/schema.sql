CREATE DATABASE IF NOT EXISTS jankalyan CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE jankalyan;

CREATE TABLE users (
    user_id INT NOT NULL AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('USER','ADMIN') NOT NULL DEFAULT 'USER',
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE user_profiles (
    profile_id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL UNIQUE,
    date_of_birth DATE,
    gender ENUM('MALE','FEMALE','OTHER'),
    state VARCHAR(50),
    district VARCHAR(50),
    annual_income DECIMAL(12,2),
    caste_category ENUM('GENERAL','OBC','SC','ST','EWS'),
    occupation VARCHAR(50),
    education_level VARCHAR(50),
    is_bpl BOOLEAN NOT NULL DEFAULT FALSE,
    disability_status BOOLEAN NOT NULL DEFAULT FALSE,
    marital_status ENUM('SINGLE','MARRIED','WIDOWED','DIVORCED'),
    land_holding_acres DECIMAL(6,2) NOT NULL DEFAULT 0,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (profile_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE schemes (
    scheme_id INT NOT NULL AUTO_INCREMENT,
    scheme_name VARCHAR(150) NOT NULL,
    description TEXT,
    department VARCHAR(100),
    level ENUM('CENTRAL','STATE') NOT NULL DEFAULT 'CENTRAL',
    state VARCHAR(50),
    category VARCHAR(50),
    official_apply_url VARCHAR(500),
    official_status_check_url VARCHAR(500),
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    source ENUM('MANUAL','DATA_GOV_IN','SCRAPER') NOT NULL DEFAULT 'MANUAL',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (scheme_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE scheme_eligibility_criteria (
    criteria_id INT NOT NULL AUTO_INCREMENT,
    scheme_id INT NOT NULL,
    field_name VARCHAR(50) NOT NULL,
    operator ENUM('=','!=','<','<=','>','>=','IN','BETWEEN') NOT NULL,
    value VARCHAR(255) NOT NULL,
    value2 VARCHAR(255),
    PRIMARY KEY (criteria_id),
    FOREIGN KEY (scheme_id) REFERENCES schemes(scheme_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE scheme_documents (
    doc_id INT NOT NULL AUTO_INCREMENT,
    scheme_id INT NOT NULL,
    document_name VARCHAR(150),
    PRIMARY KEY (doc_id),
    FOREIGN KEY (scheme_id) REFERENCES schemes(scheme_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE scheme_benefits (
    benefit_id INT NOT NULL AUTO_INCREMENT,
    scheme_id INT NOT NULL,
    benefit_description VARCHAR(255),
    PRIMARY KEY (benefit_id),
    FOREIGN KEY (scheme_id) REFERENCES schemes(scheme_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE application_tracking (
    tracking_id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    scheme_id INT NOT NULL,
    redirected_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    user_marked_status ENUM('REDIRECTED','APPLIED','APPROVED','REJECTED') NOT NULL DEFAULT 'REDIRECTED',
    proof_document_path VARCHAR(300),
    reminder_sent BOOLEAN NOT NULL DEFAULT FALSE,
    updated_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (tracking_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (scheme_id) REFERENCES schemes(scheme_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE saved_schemes (
    bookmark_id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    scheme_id INT NOT NULL,
    saved_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (bookmark_id),
    UNIQUE (user_id, scheme_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (scheme_id) REFERENCES schemes(scheme_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE scheme_sync_log (
    sync_id INT NOT NULL AUTO_INCREMENT,
    source_name VARCHAR(100),
    synced_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    records_fetched INT,
    status VARCHAR(255),
    PRIMARY KEY (sync_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE notifications (
    notification_id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    message TEXT,
    type ENUM('REMINDER','NEW_SCHEME','STATUS_UPDATE') NOT NULL DEFAULT 'REMINDER',
    is_read BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (notification_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE INDEX idx_criteria_scheme ON scheme_eligibility_criteria(scheme_id);
CREATE INDEX idx_schemes_active ON schemes(is_active);
CREATE INDEX idx_schemes_category ON schemes(category);
CREATE INDEX idx_tracking_user ON application_tracking(user_id);
CREATE INDEX idx_tracking_user_status ON application_tracking(user_id, user_marked_status);
CREATE INDEX idx_notifications_user_unread ON notifications(user_id, is_read);
CREATE INDEX idx_saved_user ON saved_schemes(user_id);
