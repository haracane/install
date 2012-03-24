# http://ant.apache.org/bindownload.cgiから最新版のバイナリ(2012/3/22時点ではapache-ant-1.8.3.bin.tar.gz)をダウンロード＆インストール

cd ~/src
wget http://ftp.jaist.ac.jp/pub/apache//ant/binaries/apache-ant-1.8.3-bin.tar.gz
tar zxvf apache-ant-1.8.3-bin.tar.gz
sudo mv apache-ant-1.8.3 /usr/lib/
sudo ln -s /usr/lib/apache-ant-1.8.3/bin/ant /etc/alternatives/ant
sudo ln -s /usr/lib/apache-ant-1.8.3/ /etc/alternatives/anthome
sudo ln -s /etc/alternatives/ant /usr/bin/ant
