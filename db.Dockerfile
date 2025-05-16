FROM postgres:15

RUN apt-get update && apt-get install -y wget gnupg lsb-release git \
    && echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
    && wget -qO - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
    && apt-get update \
    && apt-get install -y postgresql-15-pgvector \
    && rm -rf /var/lib/apt/lists/*

RUN git clone --branch dev --single-branch https://github.com/gideonaina/secad.git /tmp/secad/

RUN ls -la /tmp/secad/

# Copy custom entrypoint script & SQL files
RUN cp /tmp/secad/custom-entrypoint.sh /docker-entrypoint-initdb.d/
RUN cp /tmp/secad/initdb/*.sql /docker-entrypoint-initdb.d/

# Ensure the custom entrypoint script is executable
RUN chmod +x /docker-entrypoint-initdb.d/custom-entrypoint.sh

# Delete the temporary repository
RUN rm -rf /tmp/secad

EXPOSE 5432