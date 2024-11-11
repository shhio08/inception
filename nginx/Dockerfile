FROM debian:bullseye

# Nginxのインストール
RUN apt-get update && apt-get install -y -q nginx vim

# ADD ./conf/default.conf /etc/nginx/conf.d/default.conf
# ADD ./src /usr/share/nginx/html

RUN echo "start nginx"