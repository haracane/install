srcdir=~/src
if [ ! -d $srcdir ]; then mkdir -p $srcdir; fi
cd $srcdir

# setuptoolsをインストール
wget http://peak.telecommunity.com/dist/ez_setup.py
python ez_setup.py

# http://www.theether.org/pssh/からダウンロード
wget http://www.theether.org/pssh/pssh-1.4.3.tar.gz
tar zxvf pssh-1.4.3.tar.gz
cd pssh-1.4.3
sudo python setup.py install
