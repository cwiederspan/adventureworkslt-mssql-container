FROM mcr.microsoft.com/mssql/server:2022-latest

# Run as root
USER root

# Create a backup directory and add the .BAK file
RUN mkdir -p /var/opt/mssql/backup
COPY AdventureWorksLT2022.bak /var/opt/mssql/backup/AdventureWorksLT2022.bak

# Create a config directory
RUN mkdir -p /usr/config
WORKDIR /usr/config

# Bundle config source
COPY entrypoint.sh /usr/config
COPY configure-db.sh /usr/config
COPY setup.sql /usr/config

# Grant permissions for to our scripts to be executable
RUN chmod +x /usr/config/entrypoint.sh
RUN chmod +x /usr/config/configure-db.sh

ENTRYPOINT ["./entrypoint.sh"]