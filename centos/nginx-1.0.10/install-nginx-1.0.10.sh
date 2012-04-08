# cd ~/src
# wget http://ftp.riken.jp/Linux/fedora/epel/5/i386/epel-release-5-4.noarch.rpm  #32-bit
# wget http://ftp.riken.jp/Linux/fedora/epel/5/x86_64/epel-release-5-4.noarch.rpm  #64-bit
# sudo rpm -Uvh epel-release-5-4.noarch.rpm
# sudo  yum --enablerepo=epel install rpm-build pcre-devel zlib-devel openssl-devel
# sudo  yum --enablerepo=epel install spawn-fcgi nginx
# wget http://download.fedora.redhat.com/pub/epel/5/SRPMS/nginx-0.8.55-1.el5.src.rpm
# sudo rpm -ivh nginx-0.8.55-1.el5.src.rpm

sudo passenger-install-nginx-module
sudo mkdir -p /opt/nginx/cache
sudo mkdir -p /opt/nginx/tmp
sudo chown -R nobody:root /opt/nginx/cache
sudo chown -R nobody:root /opt/nginx/tmp

## install start-stop-daemon
cd ~/src
wget http://developer.axis.com/download/distribution/apps-sys-utils-start-stop-daemon-IR1_9_18-2.tar.gz
tar xvzf apps-sys-utils-start-stop-daemon-IR1_9_18-2.tar.gz
cd apps/sys-utils/start-stop-daemon-IR1_9_18-2/
gcc start-stop-daemon.c -o start-stop-daemon
sudo cp start-stop-daemon /usr/bin/

## create symbolic link to rails project
sudo ln -s /path/to/rails/project/public /opt/nginx/html/project

# 起動スクリプト作成
#   参考: https://github.com/haracane/install/centos/nginx-1.0.10/start-script/
# 設定ファイルコピー
#   参考: https://github.com/haracane/install/centos/nginx-1.0.10/conf/
sudo chmod 755 /etc/init.d/nginx


# サーバ秘密鍵&証明書作成
cd /opt/nginx
sudo mkdir -m 0700 ssl.{key,crt}
cd ssl.key
sudo openssl genrsa -out server.key 1024
sudo open ssl req -new -key server.key -out server.csr
sudo openssl x509 -in server.csr -out server.crt -req -signkey server.key -days 365
sudo chmod 400 server.key
sudo mv server.csr ../ssl.crt/
sudo mv server.crt ../ssl.crt/

# 自動起動設定
sudo chkconfig --add nginx
sudo chkconfig nginx on
chkconfig --list nginx

