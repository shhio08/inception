FROM debian:bullseye

# Nginxのインストール
RUN apt-get update && apt-get install -y nginx openssl vim

# ADD ./default /etc/nginx/conf.d/default.conf
# ADD ./src /usr/share/nginx/html

COPY ./nginx_init.sh /
RUN chmod +x /nginx_init.sh

CMD ["/nginx_init.sh"]
