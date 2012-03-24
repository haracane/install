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

sudo cp ./start-script/* /etc/init.d/ 
sudo cp ./conf/* /usr/lib/okuyama-CommercialUseLicense-1.0.0/install/conf/ 

sudo chmod 755 /etc/init.d/okuyama-master-node
sudo /sbin/chkconfig --add okuyama-master-node
sudo /sbin/chkconfig okuyama-master-node on
sudo /sbin/chkconfig --list okuyama-master-node

sudo chmod 755 /etc/init.d/okuyama-data-node
sudo /sbin/chkconfig --add okuyama-data-node
sudo /sbin/chkconfig okuyama-data-node on
sudo /sbin/chkconfig --list okuyama-data-node
