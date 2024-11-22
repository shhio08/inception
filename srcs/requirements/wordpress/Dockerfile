FROM debian:bullseye

RUN apt-get update \
	&& apt-get install -y vim wget unzip curl\
	&& apt-get install -y php7.4-fpm php7.4-mysql php7.4-gd php7.4-curl php7.4-xml php7.4-mbstring php7.4-zip \
	# && wget https://wordpress.org/latest.zip \
	# && unzip latest.zip \
	# && mv /wordpress/* /var/www/html/

	# wp-cliをつかえるようにする
	&& curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp \

	# wordpressファイル群を適切な場所にダウンロード
	&& mkdir -p /var/www/html \

RUN mkdir -p /run/php \
    && touch /run/php/php7.4-fpm.pid \
    && chmod 755 /run/php/php7.4-fpm.pid
# PIDファイルが必要なパスに存在しない場合、
# PHP-FPMが正常に起動できないことがあるためファイルを作成

COPY wordpress_init.sh /
RUN chmod +x /wordpress_init.sh

# EXPOSE 9000/tcp
ENTRYPOINT ["/wordpress_init.sh"]
# ENTRYPOINT ["/bin/sh", "-c", "while :; do sleep 10; done"]