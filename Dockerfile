FROM ubuntu:latest

# Avoid interactive prompts during apt installs
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/*

RUN rm -rf /var/www/html/*
COPY index.html /var/www/html/
COPY graphics.css /var/www/html/
COPY media/ /var/www/html/media/

# Change Nginx config to listen on 8080 instead of 80 (non-root friendly)
RUN sed -i 's/listen 80 default_server;/listen 8080 default_server;/g' /etc/nginx/sites-available/default && \
    sed -i 's/listen \[::\]:80 default_server;/listen \[::\]:8080 default_server;/g' /etc/nginx/sites-available/default

# Allow non-root user to write logs and cache
RUN mkdir -p /var/cache/nginx /var/run /var/log/nginx && \
    chown -R www-data:www-data /var/cache/nginx /var/run /var/log/nginx /var/www/html

# Run as non-root
USER www-data

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
