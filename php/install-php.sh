wdir=$(cd $(dirname $0); pwd)

if [ "$(rpm -qa | grep remi-release-6-1.el6.remi.noarch)" = "" ]; then
  sudo rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
  if [ $? != 0 ]; then exit 1; fi
fi

sudo yum --enablerepo=remi -y install php-cli php-fpm php-devel php-gd php-mbstring php-mysql php-pdo php-pear php-xm
if [ $? != 0 ]; then exit 1; fi

