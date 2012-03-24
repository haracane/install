# Antがない場合はAntをインストールする.

WDIR=$(cd $(dirname $0); pwd)

# http://okuyama-project.com/ja/okuyama/download.html から商用版をダウンロード&インストール

cd ~/src
unzip okuyama-CommercialUseLicense-1.0.0.zip
cd okuyama-CommercialUseLicense-1.0.0
ant compile
cd ..
sudo mv okuyama-CommercialUseLicense-1.0.0 /usr/lib/
sudo ln -s /usr/lib/okuyama-CommercialUseLicense-1.0.0 /usr/lib/okuyama
sudo mkdir -p /var/log/okuyama
sudo mkdir -p /data/okuyama/keymapfile

## Mac OS X:
## you should edit /etc/auto_master and comment out /home
## then execute the commands:
## $ sudo automount
## $ sudo mkdir -p /home/okuyama/okuyama/logs

cd $WDIR

sudo cp ./conf/* /usr/lib/okuyama/install/conf/ 
sudo cp ./start-script/* /usr/lib/okuyama/install/bin/
sudo chmod 755 /usr/lib/okuyama/install/bin/okuyama-master-node
sudo chmod 755 /usr/lib/okuyama/install/bin/okuyama-master-node-memcached
sudo chmod 755 /usr/lib/okuyama/install/bin/okuyama-data-node

sudo cp /usr/lib/okuyama/install/bin/okuyama-master-node /etc/init.d/
sudo /sbin/chkconfig --add okuyama-master-node
sudo /sbin/chkconfig okuyama-master-node on
sudo /sbin/chkconfig --list okuyama-master-node

sudo cp /usr/lib/okuyama/install/bin/okuyama-master-node-memcached /etc/init.d/
sudo /sbin/chkconfig --add okuyama-master-node-memcached
sudo /sbin/chkconfig okuyama-master-node-memcached on
sudo /sbin/chkconfig --list okuyama-master-node-memcached

sudo cp /usr/lib/okuyama/install/bin/okuyama-data-node /etc/init.d/
sudo /sbin/chkconfig --add okuyama-data-node
sudo /sbin/chkconfig okuyama-data-node on
sudo /sbin/chkconfig --list okuyama-data-node
