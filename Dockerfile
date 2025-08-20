FROM nginx:alpine

# Clean existing html
RUN rm -rf /usr/share/nginx/html/*

# Copy website files
COPY index.html /usr/share/nginx/html/
COPY graphics.css /usr/share/nginx/html/
COPY media/ /usr/share/nginx/html/media/

# Fix permissions for OpenShift (non-root UID)
RUN chown -R 1001:0 /usr/share/nginx/html \
    && chmod -R g+rwX /usr/share/nginx/html

USER 1001

EXPOSE 80

# Use nginx default entrypoint
CMD ["nginx", "-g", "daemon off;"]
