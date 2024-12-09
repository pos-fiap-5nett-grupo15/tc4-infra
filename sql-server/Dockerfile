FROM mcr.microsoft.com/mssql/server:2017-latest

RUN apt-get update
RUN apt-get install -y gettext-base
# Create a config directory
RUN mkdir -p /usr/config
WORKDIR /usr/config

# Bundle config source
COPY . /usr/config

# Grant permissions
RUN chmod +x /usr/config/entrypoint.sh
RUN chmod +x /usr/config/configure-db.sh


ENTRYPOINT ["./entrypoint.sh"]