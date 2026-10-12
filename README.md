# snapchat-backend
A production-ready Snapchat-inspired social media backend built with Java Spring Boot 3.x.

This project contains the backend only: Java, Spring Boot, Spring Security with JWT, JPA, MySQL, WebSocket chat, notifications, media uploads, and scheduled expiration logic.

## Features
- User registration, login, JWT auth, refresh tokens, and logout flow.
- User profile management, friend requests, friendships, and search.
- Snaps with media upload, delivery tracking, expiration, and access checks.
- Stories with 24h expiry and viewer tracking.
- Real-time one-to-one chat and notifications via WebSocket.
- Local file storage with validation on type and size.
- Swagger UI and OpenAPI docs.
- Validation, global exceptions, scheduled cleanup jobs, and unit/integration testing.

## Tech stack
- Java 21
- Spring Boot 3.3.x
- Spring Security + JWT
- Spring Data JPA + Hibernate
- MySQL 8
- WebSocket/STOMP
- Maven
- Swagger/OpenAPI
- Local media storage

## Prerequisites
- JDK 21+
- Maven 3.9+
- Docker (optional, for MySQL and Redis)

## Quick start
1. Copy `.env.example` to `.env` and update values if needed.
2. Start the database dependencies:
   ```bash
   docker compose up -d mysql redis
   ```
3. Run the application:
   ```bash
   mvn spring-boot:run
   ```
4. Use Swagger UI at `http://localhost:8080/swagger-ui.html`

## Configuration
Application settings live in `src/main/resources/application.yml` and environment variables in `.env`.

### MySQL setup
- Database name: `snapdb`
- Username: `snapuser`
- Password: `snappass`

### Local media storage
- Files are saved under `./uploads` by default.
- Configure `APP_STORAGE_PATH` to change the directory.

## Main REST APIs
- `/api/auth`
- `/api/users`
- `/api/friends`
- `/api/snaps`
- `/api/stories`
- `/api/chats`
- `/api/notifications`

## WebSocket
- STOMP endpoint: `/ws`
- Application prefix: `/app`
- Broker: `/topic`
- Chat topics: `/topic/conversation.{conversationId}`
- Notification topics: `/topic/notifications.{userId}`

## Example requests
### Register
```bash
curl -X POST http://localhost:8080/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "username": "alice",
    "email": "alice@example.com",
    "password": "Password123!",
    "displayName": "Alice"
  }'
```

### Login
```bash
curl -X POST http://localhost:8080/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "login": "alice",
    "password": "Password123!"
  }'
```

### Friends request
```bash
curl -X POST http://localhost:8080/api/friends/request/2 \
  -H "Authorization: Bearer <token>"
```

### Upload snap
```bash
curl -X POST http://localhost:8080/api/snaps/upload \
  -H "Authorization: Bearer <token>" \
  -F "file=@/path/to/media.png" \
  -F 'request={"caption":"Hello!","mediaType":"IMAGE","recipientIds":[2],"expiresInMinutes":60}'
```

## Testing
```bash
mvn test
```

## Notes
- This project intentionally does not include frontend code.
- External cloud storage is optional; local storage is enabled by default.
- Never commit real secrets into Git. Use environment variables.
