FROM ubuntu:20.04

# Disable prompts during package install
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/*

RUN rm -rf /var/www/html/*
COPY index.html /var/www/html/
COPY graphics.css /var/www/html/
COPY media/ /var/www/html/media/

EXPOSE 80

# Run nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
