FROM nginx

WORKDIR /etc/nginx/conf.d/

COPY ../src/nginx/default.conf .

EXPOSE 8000

