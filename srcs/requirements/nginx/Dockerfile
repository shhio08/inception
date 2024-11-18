FROM debian:bullseye

# Nginxのインストール
RUN apt-get update && apt-get install -y nginx vim

# ADD ./default /etc/nginx/conf.d/default.conf
# ADD ./src /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]
