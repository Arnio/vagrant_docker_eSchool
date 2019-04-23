# Derived from official mysql image (our base image)
FROM mysql:latest
# Add a database
ENV MYSQL_ROOT_PASSWORD toor
ENV MYSQL_DATABASE eschool
ENV MYSQL_USER eschool
ENV MYSQL_PASSWORD eschool
# Add the content of the sql-scripts/ directory to your image
# All scripts in docker-entrypoint-initdb.d/ are automatically
# executed during container startup
#COPY ./sql-scripts/ /docker-entrypoint-initdb.d/
EXPOSE 3306