FROM nginx:alpine

# Clean default html
RUN rm -rf /usr/share/nginx/html/*

# Copy website files
COPY index.html /usr/share/nginx/html/
COPY graphics.css /usr/share/nginx/html/
COPY media/ /usr/share/nginx/html/media/

# Prepare Nginx cache/temp dirs for non-root UID
RUN mkdir -p /var/cache/nginx /var/run /var/log/nginx \
    && chown -R 1001:0 /var/cache/nginx /var/run /var/log/nginx /usr/share/nginx/html \
    && chmod -R g+rwX /var/cache/nginx /var/run /var/log/nginx /usr/share/nginx/html

# Run as OpenShift-friendly user
USER 1001

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
