FROM nginx

WORKDIR /etc/nginx/conf.d/

COPY ../nginx/default.conf .

EXPOSE 8000

