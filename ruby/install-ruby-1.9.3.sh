if [ $USER != root ]; then
  echo "user should be 'root'" >&2
  exit 1
fi

srcdir=/root/src
if [ ! -d $srcdir ]; then mkdir -p $srcdir; fi
cd $srcdir

url=$1

if [ "$url" = "" ]; then
  url="ftp://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p327.tar.gz"
fi

tarball=${url##*/}
dirname=${tarball%%.tar.gz}

if [ ! -f $tarball ]; then
  wget $url
  if [ $? != 0 ]; then exit 1; fi
fi

if [ ! -d $dirname ]; then
  tar xvfz $tarball
  if [ $? != 0 ]; then exit 1; fi
fi

cd  $dirname
./configure
if [ $? != 0 ]; then exit 1; fi

make
if [ $? != 0 ]; then exit 1; fi

make install
if [ $? != 0 ]; then exit 1; fi

gem install bundle
if [ $? != 0 ]; then exit 1; fi
