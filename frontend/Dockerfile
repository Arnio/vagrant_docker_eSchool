# Pull base image.
FROM nginx:latest

COPY ./dist/eSchool ./usr/share/nginx/html/
COPY ./frontend/nginx.conf ./etc/nginx/nginx.conf
EXPOSE 80

