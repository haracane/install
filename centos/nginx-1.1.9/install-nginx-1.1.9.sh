cd ~/src
wget http://ftp.riken.jp/Linux/fedora/epel/5/i386/epel-release-5-4.noarch.rpm  #32-bit
# wget http://ftp.riken.jp/Linux/fedora/epel/5/x86_64/epel-release-5-6.noarch.rpm  #64-bit
sudo rpm -Uvh epel-release-5-4.noarch.rpm
sudo  yum --enablerepo=epel install rpm-build spawn-fcgi pcre-devel zlib-devel openssl-devel
wget http://download.fedora.redhat.com/pub/epel/5/SRPMS/nginx-0.8.55-1.el5.src.rpm
sudo rpm -ivh nginx-0.8.55-1.el5.src.rpm 

cd /usr/src/redhat/SOURCES/
sudo wget http://nginx.org/download/nginx-1.1.9.tar.gz
sudo wget http://labs.frickle.com/files/ngx_cache_purge-1.5.tar.gz
tar zxvf ngx_cache_purge-1.5.tar.gz
cd ngx_cache_purge-1.5
cp README.md README
cd ..
tar zcvf ngx_cache_purge-1.5.tar.gz ngx_cache_purge-1.5
rm -rf ngx_cache_purge-1.5
# copy nginx.spec to /usr/src/redhat/SPECS/
cd /usr/src/redhat/SPECS
sudo rpmbuild -bb nginx.spec
