FROM ubuntu:latest
RUN apt-get update && apt-get install -y nginx

RUN rm -rf /var/www/html/*
COPY index.html /var/www/html/
COPY graphics.css /var/www/html/
COPY media/ /var/www/html/media/

EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
