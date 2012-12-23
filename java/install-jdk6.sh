srcdir=~/src
if [ ! -d $srcdir ]; then mkdir -p $srcdir; fi
cd $srcdir

sudo wget http://download.oracle.com/otn-pub/java/jdk/6u30-b12/jdk-6u30-linux-x64-rpm.bin
sudo chmod +x jdk-6u30-linux-x64-rpm.bin #←実行権を付与
sudo ./jdk-6u30-linux-x64-rpm.bin
sudo java -version
# java version "1.6.0_30"