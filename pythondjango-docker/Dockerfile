# Base image with Python 3.13
FROM python:3.13-slim-bookworm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    libpq-dev \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Install uv - pin to specific version for reproducibility
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Set environment variables for uv
ENV UV_COMPILE_BYTECODE=1
ENV UV_LINK_MODE=copy

# Create app user
RUN groupadd --system app && \
    useradd --system --gid app --create-home app

# Set working directory
WORKDIR /app

# Change ownership of the app directory
RUN chown -R app:app /app

# Switch to non-root user
USER app

# Copy dependency files first (for better caching)
COPY --chown=app:app pyproject.toml uv.lock ./

# Install dependencies
RUN uv sync --locked --no-install-project

# Copy the rest of the application
COPY --chown=app:app . .

# Final sync to install the project itself
RUN uv sync --locked

# Expose port 8000
EXPOSE 8000

# Set the PATH to include the virtual environment
ENV PATH="/app/.venv/bin:$PATH"

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:8000/ || exit 1

# Default command - can be overridden in docker-compose
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]