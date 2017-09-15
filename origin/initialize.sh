#!/usr/bin/env bash

test -f /etc/initialized && exit

wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
dpkg -i erlang-solutions_1.0_all.deb

apt-get update
apt-get install -y npm esl-erlang inotify-tools samba
apt-get upgrade -y

systemctl restart smbd nmbd

echo "mysql-server mysql-server/root_password password root" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections
apt-get install -y mysql-server
mysql -u root -proot -e "set password for root@localhost=password('')"

rm -f erlang-solutions_1.0_all.deb

npm cache clean
npm install n -g

n 7
apt-get purge -y npm

git clone -b v1.4 https://github.com/elixir-lang/elixir.git
cd elixir/
make
make install
cd
rm -rf elixir/

# ln -sf  /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

apt-get clean

wget https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub
mv vagrant.pub /home/vagrant/.ssh/authorized_keys
chmod 700 /home/vagrant/.ssh
chmod 600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh

date > /etc/initialized
