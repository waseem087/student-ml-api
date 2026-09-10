FROM python:3.12-slim

ARG APP_VERSION=unknown
ARG GIT_COMMIT=unknown
ARG SOURCE_REPO=unknown
ARG BUILD_DATE=unknown

LABEL org.opencontainers.image.title="student-ml-api" \
      org.opencontainers.image.version="$APP_VERSION" \
      org.opencontainers.image.revision="$GIT_COMMIT" \
      org.opencontainers.image.source="$SOURCE_REPO" \
      org.opencontainers.image.created="$BUILD_DATE"

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

EXPOSE 5000

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "5000"]