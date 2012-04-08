srcdir=~/src
if [ ! -d $srcdir ]; then mkdir -p $srcdir; fi
cd $srcdir

yum -y install gcc-c++

gem install passenger #--version 2.2.15
export APXS2=/usr/local/apache2/bin/apxs
export PATH=/usr/local/apache2/bin:$PATH
passenger-install-apache2-module
