#!/bin/bash

echo "======================================================================================================="
echo "==============================Installing puppet========================================================"
echo "======================================================================================================="

sudo yum update -y

sudo yum install git -y


sudo rpm -Uvh https://yum.puppet.com/puppet5/puppet5-release-el-6.noarch.rpm

#sudo rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm

sudo yum install puppet-server -y


sudo puppet resource package puppet-server ensure=latest


/etc/init.d/puppetmaster restart


sudo yum install puppet

sudo puppet resource package puppet ensure=latest
sudo puppet resource service puppet ensure=running


echo "======================================================================================================="
echo "==============================Installing Ruby=========================================================="
echo "======================================================================================================="



sudo yum install gcc-c++ patch readline readline-devel zlib zlib-devel -y
sudo yum install libyaml-devel libffi-devel openssl-devel make -y
sudo yum install bzip2 autoconf automake libtool bison iconv-devel sqlite-devel -y
curl -sSL https://rvm.io/mpapis.asc | gpg --import -
curl -L get.rvm.io | bash -s stable
curl ftp://195.220.108.108/linux/centos/7/os/x86_64/Packages/libyaml-devel-0.1.4-11.el7_0.x86_64.rpm --output libyaml-devel-0.1.4-11.el7_0.x86_64.rpm
sudo rpm -Uvh libyaml-devel-0.1.4-11.el7_0.x86_64.rpm
source /etc/profile.d/rvm.sh
echo "======================================================================================================="
echo "======================================= Setting RVM ENV ==============================================="
echo "======================================= Setting RVM ENV ==============================================="
source /home/$USER/.rvm/scripts/rvm
if [ $? = 0 ]
	then
	echo "================================Success!============================================================"
fi

echo "======================================================================================================="
echo "======================================================================================================="
rvm reload

rvm install ruby-2.2.0 --autolibs=read-only

rvm use 2.2.0 --default


gem install bundle

gem install r10k

gem install generate-puppetfile


bash --login

rvm use system

#export PATH=$PATH:/usr/local/rvm/gems/ruby-2.2.4/bin/

#export PATH=$PATH:/usr/local/rvm/rubies/ruby-2.2.4/bin


cp -r /home/vagrant/Wildfly/modules/* /usr/share/puppet/

/opt/puppetlabs/puppet/modules

iptables -F 
iptables -A INPUT -p tcp -m tcp --dport 8080 -j ACCEPT
iptables-save


sudo -u postgres psql 


