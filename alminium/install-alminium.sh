if [ $USER != root ]; then
  echo "user should be 'root'" >&2
  exit 1
fi

yum -y install git

srcdir=/root/src
if [ ! -d $srcdir ]; then mkdir -p $srcdir; fi
cd $srcdir

if [ ! -d alminium ]; then
  git clone https://github.com/alminium/alminium.git
  if [ $? != 0 ]; then exit 1; fi
fi

cd alminium
bash ./smelt
