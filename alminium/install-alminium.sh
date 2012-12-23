if [ $USER != root ]; then
  echo "user should be 'root'" >&2
  exit 1
fi

yum -y install git 

if [ ! -d /root/src ]; then mkdir /root/src; fi

cd /root/src

if [ ! -d alminium ]; then
  git clone https://github.com/alminium/alminium.git
  if [ $? != 0 ]; then exit 1; fi
fi

cd alminium
bash ./smelt
