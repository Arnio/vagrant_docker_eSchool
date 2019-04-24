# Pull base image.
FROM nginx:latest

COPY ./dist/eschool/ ./var/www/
COPY ./frontend/nginx.conf ./etc/nginx/nginx.conf
EXPOSE 80

