
# *JanKalyan*

## Government Scheme Eligibility Portal

A web application that helps people discover government schemes they are eligible for without having to search through multiple websites.

Users create their profile once — including income, caste, state, education, and related details — and the system evaluates available schemes against their eligibility criteria. Eligible users can then be redirected to the official government portal to apply.

## What It Does

- Collects a user's eligibility profile once.
- Matches the user against government-scheme eligibility criteria.
- Supports criteria such as income, age, caste, state, education, occupation, BPL status, and more.
- Redirects users to official government application portals.
- Tracks application progress and user-reported status updates.
- Provides an admin interface for managing schemes and triggering data synchronization.

## Tech Stack

### Backend

- Java 21
- Spring Boot 3.2.5
- MySQL 8.0
- Spring Security + JWT
- JPA / Hibernate
- Maven

### Frontend

> The frontend is maintained separately / will be added later.

- React
- TypeScript
- Tailwind CSS
- Axios

## Prerequisites

- Java 21 or higher
- MySQL 8.0
- Maven 3.8+

## Setup Instructions

### 1. Clone the Repository

```bash
git clone <your-repository-url>
cd JanKalyan/Backend
```

### 2. Database Setup

Create the database in MySQL:

```sql
CREATE DATABASE scheme_portal_db;
```

Then update `application.properties` with your MySQL credentials:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/scheme_portal_db
spring.datasource.username=your_mysql_username
spring.datasource.password=your_mysql_password
```

### 3. Build the Project

```bash
mvn clean install
```

### 4. Run the Project

```bash
mvn spring-boot:run
```

The backend starts at:

```text
http://localhost:8080
```

Swagger UI:

```text
http://localhost:8080/swagger-ui/index.html
```

OpenAPI documentation:

```text
http://localhost:8080/v3/api-docs
```

## Project Structure

```text
src/main/java/com/portal/schemes/
├── config/          # Security, JWT filter, CORS
├── controller/      # REST endpoints
├── dto/             # Request and response objects
├── entity/          # Database entities
├── exception/       # Exception classes and global error handling
├── repository/      # Database queries
├── scheduler/       # Background jobs such as sync and reminders
├── service/         # Business logic
└── util/            # Utility classes such as JWT utilities
```

## Key Features

### 1. Smart Eligibility Engine

- Dynamic rule matching based on the user profile.
- Supports the following operators:
  - `=`
  - `!=`
  - `<`
  - `<=`
  - `>`
  - `>=`
  - `IN`
  - `BETWEEN`
- Can evaluate profile fields such as:
  - Annual income
  - Age
  - Caste category
  - Gender
  - State
  - District
  - Occupation
  - Education level
  - BPL status
  - Disability status
  - Marital status
  - Land holding

### 2. Real-Time Application Tracking

- Tracks when a user clicks **Apply**.
- Supports user-reported application statuses:
  - Redirected
  - Applied
  - Approved
  - Rejected
- Sends automatic reminders when there is no update after 5 days.

### 3. Admin Panel

- CRUD operations for schemes.
- Add and manage eligibility criteria dynamically.
- Manual data synchronization trigger.
- Dashboard statistics.

### 4. Data Synchronization

Optional integration with `data.gov.in`.

- Scheduled daily synchronization at 2 AM.
- Logs synchronization attempts and results.
- Manual synchronization can be triggered from the admin side.

### 5. Notifications

- Status-change notifications.
- Reminders for incomplete or pending applications.
- Automatic cleanup of old read notifications after 30 days.

## API Endpoints

### Authentication

```http
POST /api/auth/register
POST /api/auth/login
```

### Profile

```http
GET  /api/profile/{userId}
PUT  /api/profile/{userId}
```

### Schemes

```http
GET /api/schemes
GET /api/schemes/{id}
GET /api/schemes/category/{category}
```

### Eligibility

Core eligibility-checking endpoint:

```http
POST /api/eligibility/check/{userId}
```

### Applications

```http
POST /api/apply/redirect/{schemeId}?userId=X
PUT  /api/apply/status/{trackingId}
GET  /api/apply/user/{userId}
```

### Admin

Requires `ADMIN` role:

```http
POST   /api/admin/schemes
PUT    /api/admin/schemes/{id}
DELETE /api/admin/schemes/{id}
GET    /api/admin/dashboard/stats
POST   /api/admin/sync/trigger
```

See Swagger UI for the complete API specification.

## Sample Request / Response

### Check Eligibility

Request:

```http
POST /api/eligibility/check/1
```

Example response:

```json
{
  "success": true,
  "message": "Found 3 matching schemes",
  "data": [
    {
      "schemeId": 5,
      "schemeName": "PM-KISAN",
      "department": "Agriculture Ministry",
      "matchPercentage": 100,
      "benefits": [
        "₹6000/year direct transfer"
      ],
      "requiredDocuments": [
        "Aadhaar",
        "Land records"
      ]
    }
  ]
}
```

## Database Schema Highlights

The project uses 10 tables covering authentication, user eligibility data, scheme information, application tracking, bookmarks, synchronization logs, and notifications.

### Core tables

- `users` — authentication and user information
- `user_profiles` — eligibility-related profile data
- `schemes` — government scheme information
- `scheme_eligibility_criteria` — dynamic eligibility rules
- `scheme_documents` — required documents
- `scheme_benefits` — scheme benefits
- `application_tracking` — application journey tracking
- `saved_schemes` — bookmarked schemes
- `scheme_sync_log` — synchronization history
- `notifications` — user notifications

Foreign keys are used for related records, with indexes on frequently queried fields.

## Background Jobs

| Job | Schedule | What It Does |
|---|---|---|
| Scheme Sync | 2 AM daily | Pulls scheme data from `data.gov.in` |
| Reminders | 9 AM daily | Notifies users with pending applications |
| Cleanup | 3 AM Sunday | Deletes old read notifications |
| Health Check | Every 5 minutes | Checks database connectivity |

## Security

- JWT-based authentication.
- Passwords hashed using BCrypt (strength 12).
- Role-based access control with `USER` and `ADMIN` roles.
- CORS configured for the frontend.
- Input validation on endpoints.
- JPA parameterized queries for SQL-injection-safe database access.

## Known Limitations / Future Scope

1. **No direct submission to government portals**  
   The application redirects users to official portals rather than submitting applications on their behalf.

2. **Application status is self-reported**  
   The system does not automatically retrieve application status because government portals do not expose the required APIs.

3. **Data synchronization depends on `data.gov.in` availability**  
   If the API is unavailable or rate-limited, manual admin entry may be required.

4. **Scraper is proof-of-concept**  
   The scraper is not intended for production use because of possible terms-of-service considerations.

## Testing

A default admin user can be created manually or through SQL:

```sql
INSERT INTO users (full_name, email, password_hash, role)
VALUES (
    'Admin User',
    'admin@test.com',
    '$2a$12$hashedpasswordhere',
    'ADMIN'
);
```

A normal test user can register through:

```http
POST /api/auth/register
```

## Important Notes

- Use a secure random JWT secret in production (minimum 256 bits).
- Configure the `data.gov.in` API key if synchronization is enabled.
- Logs are written to the console by default.
- A `logback.xml` configuration can be added for file-based logging.
- For production deployments, change:

```properties
spring.jpa.hibernate.ddl-auto=validate
```

instead of using automatic schema updates.

## Troubleshooting

### Port 8080 Already in Use

Change the port in `application.properties`:

```properties
server.port=8081
```

Then access the backend at:

```text
http://localhost:8081
```

### Database Connection Failed

Check that MySQL is running and verify the database credentials in `application.properties`.

For Linux:

```bash
sudo systemctl status mysql
```

Also verify:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/scheme_portal_db
spring.datasource.username=your_mysql_username
spring.datasource.password=your_mysql_password
```

### JWT Token Expired

The default token expiry is 24 hours:

```properties
jwt.expiration=86400000
```

Log in again to obtain a new token.

## Project Demo Flow

1. User registers.
2. User completes their profile with income, state, caste, education, and other details.
3. User selects **Check Eligibility**.
4. The eligibility engine evaluates schemes against the user's profile.
5. Matching schemes are displayed.
6. User clicks **Apply Now** and is redirected to the official government portal.
7. The application tracking record is created.
8. User returns and updates the application status.
9. Notifications and reminders are generated as applicable.
10. Admin can add or update schemes.
11. Scheduled jobs can synchronize scheme data and perform maintenance tasks.

## Contact / Support

For issues or questions during evaluation:

- Check the Swagger documentation first.
- Review the backend console logs for detailed error traces.
- `GlobalExceptionHandler` provides structured JSON error responses.

## License
https://github.com/AshIndian-Coder/JanKalyan/blob/348c8774a1dc7cb69d73a4e3cb009dbc06189e3c/LICENSE
