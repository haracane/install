sudo passenger-install-nginx-module
sudo mkdir -p /opt/nginx/cache
sudo mkdir -p /opt/nginx/tmp
sudo chown -R nobody:root /opt/nginx/cache
sudo chown -R nobody:root /opt/nginx/tmp

cd ~/src
wget http://developer.axis.com/download/distribution/apps-sys-utils-start-stop-daemon-IR1_9_18-2.tar.gz
tar xvzf apps-sys-utils-start-stop-daemon-IR1_9_18-2.tar.gz
cd apps/sys-utils/start-stop-daemon-IR1_9_18-2/
gcc start-stop-daemon.c -o start-stop-daemon
sudo cp start-stop-daemon /usr/bin/
chmod 755 /etc/init.d/nginx

sudo ln -s /usr/local/twitter-trend/rails/trendword/public /opt/nginx/html/trendword

# 起動スクリプト作成
# 設定ファイルコピー
cd /opt/nginx
sudo mkdir -m 0700 ssl.{key,crt}
cd ssl.key
sudo openssl genrsa -out server.key 1024
sudo open ssl req -new -key server.key -out server.csr
sudo openssl x509 -in server.csr -out server.crt -req -signkey server.key -days 365
sudo chmod 400 server.key
sudo mv server.csr ../ssl.crt/
sudo mv server.crt ../ssl.crt/


sudo chkconfig --add nginx
sudo chkconfig nginx on
chkconfig --list nginx

