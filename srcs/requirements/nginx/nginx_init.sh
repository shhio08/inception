#!/bin/bash

SSL_DIR="/etc/nginx/ssl"
NGINX_PASS="password"

# SSLディレクトリを作成
mkdir -p $SSL_DIR

# 秘密鍵の生成
openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:2048 -out $SSL_DIR/privkey.pem || { echo "Failed to generate private key"; exit 1; }

# 証明書署名要求(CSR)の作成
openssl req -new -key $SSL_DIR/privkey.pem -out $SSL_DIR/csr.pem -subj "/C=jp/ST=tokyo/L=tokyo/O=42/OU=42/CN=nginx" || { echo "Failed to generate CSR"; exit 1; }

# 証明書の作成
openssl x509 -req -in $SSL_DIR/csr.pem -signkey $SSL_DIR/privkey.pem -days 90 -out $SSL_DIR/crt.pem || { echo "Failed to create certificate"; exit 1; }

#   cd /etc/nginx/ssl
#   # 秘密鍵の作成
#   openssl genrsa -out privkey.pem 2048

#   # 証明書署名要求 (CSR) の作成
#   openssl req -new -key privkey.pem -out csr.pem \
#       -subj "/C=JP/ST=Tokyo/L=Chiyoda/O=LocalDev/CN=localhost"

#   # 自己署名証明書の作成 (有効期限 365 日)
#   openssl x509 -req -days 365 -in csr.pem -signkey privkey.pem -out crt.pem


# nginxの設定ファイルをテスト
# nginx -t || { echo "nginx configuration test failed"; exit 1; }

# nginxをリロードして設定を反映
# nginx -s reload || { echo "Failed to reload nginx"; exit 1; }

# nginxをフォアグラウンドで実行
exec nginx -g "daemon off;"