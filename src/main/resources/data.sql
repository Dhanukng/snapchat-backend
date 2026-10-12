INSERT INTO users (id, username, email, password, display_name, bio, profile_picture_url, enabled, created_at, updated_at)
VALUES
  (1, 'admin', 'admin@snap.local', '$2a$10$D0yQJ5xDAqfJwJY4Nu9CY.vJ4B5nA1z5lQp0Q4P0rS0CzLQv8T2Mu', 'Admin', 'System administrator', NULL, true, NOW(), NOW()),
  (2, 'alice', 'alice@example.com', '$2a$10$D0yQJ5xDAqfJwJY4Nu9CY.vJ4B5nA1z5lQp0Q4P0rS0CzLQv8T2Mu', 'Alice', 'Photographer', NULL, true, NOW(), NOW()),
  (3, 'bob', 'bob@example.com', '$2a$10$D0yQJ5xDAqfJwJY4Nu9CY.vJ4B5nA1z5lQp0Q4P0rS0CzLQv8T2Mu', 'Bob', 'Tech enthusiast', NULL, true, NOW(), NOW())
ON DUPLICATE KEY UPDATE username = VALUES(username);
