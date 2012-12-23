sudo curl http://archive.cloudera.com/redhat/cdh/cloudera-cdh2.repo > /etc/yum.repos.d/cloudera-cdh2.repo
sudo yum -y update yum
sudo yum -y install hadoop-0.20.noarch
sudo yum -y install hadoop-pig.noarch
	
sudo su hadoop
cd
mkdir -p .ssh
chmod 700 .ssh
cd ~/.ssh
echo -n | ssh-keygen -t rsa #← 空のパスフレーズで鍵を作成
cat id_rsa.pub >> authorized_keys
chmod 600 id_rsa
chmod 600 authorized_keys