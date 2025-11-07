-- PostgreSQL initialization script
-- This script runs when the database container starts for the first time

-- Create the database if it doesn't exist (usually handled by POSTGRES_DB env var)
-- CREATE DATABASE bookstoredjuv;

-- You can add additional initialization queries here
-- For example, creating additional users, extensions, etc.

-- Enable some useful extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pg_trgm";

-- Set timezone
SET timezone = 'UTC';