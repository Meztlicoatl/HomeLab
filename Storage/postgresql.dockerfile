ARG IMAGE
FROM "${IMAGE}"

RUN apt-get update && apt-get install -y \
    postgresql-server-dev-all build-essential git curl \
    postgresql-18-cron \
    && rm -rf /var/lib/apt/lists/*