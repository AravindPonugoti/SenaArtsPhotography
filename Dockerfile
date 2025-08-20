FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html/*

COPY index.html /usr/share/nginx/html/
COPY graphics.css /usr/share/nginx/html/
COPY media/ /usr/share/nginx/html/media/

EXPOSE 80
