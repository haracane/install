srcdir=~/src
if [ ! -d $srcdir ]; then mkdir -p $srcdir; fi
cd $srcdir

wget ftp://ftp.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p330.tar.gz
tar xvfz ruby-1.8.7-p330.tar.gz
cd  ruby-1.8.7-p330
./configure
make
sudo make install

#/usr/bin/rubyが存在していれば削除
sudo rm -f /usr/bin/ruby 
sudo ln -s /usr/local/bin/ruby /usr/bin/ruby
ruby -v
# ruby 1.8.7 (2010-01-10 patchlevel 330) [i686-linux]
which ruby

## opensslをインストール
sudo yum -y install openssl-devel
$srcdir/ruby-1.8.7-p330/ext/openssl/
ruby extconf.rb
make
sudo make install

## zlibをインストール
sudo yum -y install zlib-devel
$srcdir/ruby-1.8.7-p330/ext/zlib/
ruby extconf.rb
make
sudo make install
	