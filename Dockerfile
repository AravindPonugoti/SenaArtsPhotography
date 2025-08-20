FROM ubuntu:20.04

# Disable interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install nginx and dependencies
RUN apt-get update && \
    apt-get install -y nginx curl && \
    rm -rf /var/lib/apt/lists/*

# Ensure nginx runs in foreground and log dirs exist
RUN mkdir -p /var/run/nginx

# Remove default content
RUN rm -rf /var/www/html/*

# Copy your site content
COPY index.html /var/www/html/
COPY graphics.css /var/www/html/
COPY media/ /var/www/html/media/

# Expose port 80
EXPOSE 80

# Run nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
