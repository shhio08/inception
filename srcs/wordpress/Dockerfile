FROM debian:bullseye

RUN apt-get update \
	&& apt-get install -y vim wget unzip \
	&& apt-get install -y php7.4-fpm php7.4-mysql php7.4-gd php7.4-curl php7.4-xml php7.4-mbstring php7.4-zip \
	&& wget https://wordpress.org/latest.zip \
	&& unzip latest.zip \
	&& mkdir -p /var/www/html \
	&& mv /wordpress/* /var/www/html/

RUN mkdir -p /run/php \
    && touch /run/php/php7.4-fpm.pid \
    && chmod 755 /run/php/php7.4-fpm.pid
# PIDファイルが必要なパスに存在しない場合、
# PHP-FPMが正常に起動できないことがあるためファイルを作成

# RUN service php7.4-fpm start \
# 	&& service php7.4-fpm stop
# RUN sleep 3

CMD ["php-fpm7.4", "-F"]

EXPOSE 9000/tcp
# ENTRYPOINT ["/bin/sh", "-c", "while :; do sleep 10; done"]
