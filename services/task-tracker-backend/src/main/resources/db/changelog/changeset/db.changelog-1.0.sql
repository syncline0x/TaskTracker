--liquibase formatted sql

--changeset oxerr:1
CREATE TABLE IF NOT EXISTS  users(
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    email VARCHAR(254) NOT NULL ,
    password VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT now()
)

--changeset oxerr:2
CREATE TABLE IF NOT EXISTS  tasks(
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id BIGINT NOT NULL,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    status VARCHAR NOT NULL,
    created_at TIMESTAMP DEFAULT now(),
    marked_at TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
)

--changeset oxerr:3
CREATE TABLE IF NOT EXISTS  refresh_tokens(
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id BIGINT NOT NULL,
    token VARCHAR(512) NOT NULL,
    expires_at TIMESTAMP NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
)