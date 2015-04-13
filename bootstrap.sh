#!/bin/bash

ls /vagrant/lib-setup.sh || { echo "vagrant mount not working";exit 1; }

apt-get update
apt-get upgrade

sudo apt-get install -y xubuntu-desktop

#echo 'APT::Install-Recommends "0";' >/etc/apt/apt.conf
#echo 'APT::Install-Suggests "0";' >>/etc/apt/apt.conf

sudo /usr/share/debconf/fix_db.pl
sudo dpkg --configure -a

sudo apt-get remove -y gnumeric abiword xscreensaver  thunderbird xchat xfburn  gnome-sudoku gnome-mines abiword-common xchat-common gnome-screensaver gnumeric-common gnumeric-doc libabiword-3.0

apt-get install -y xfce4-terminal firefox eclipse-cdt

apt-get install -y git emacs zile subversion git-cola gitk meld gdb valgrind g++    gfortran \
    libblas-dev \
    liblapack-dev \
    libopenmpi-dev \
    openmpi-bin \
    cmake \
    wget \
    python \
    numdiff \
    leafpad gnuplot ninja-build  htop paraview


echo ubuntu:ubuntu | sudo chpasswd

echo -e "[SeatDefaults]\nautologin-user=ubuntu\nautologin-user-timeout=0" | sudo tee /etc/lightdm/lightdm.conf.d/our.conf

echo "dealvm" | sudo tee /etc/hostname

#base:
cd /home/ubuntu
sudo -u ubuntu cp /vagrant/bash_aliases /home/ubuntu/.bash_aliases
sudo -u ubuntu cp /vagrant/info.html /home/ubuntu/Desktop/
sudo -u ubuntu mkdir -p bin
sudo -u ubuntu rmdir Pictures Music Public Templates Videos >/dev/null 2>&1

#visit:
if [ ! -d "/home/ubuntu/bin/visit2_8_2.linux-x86_64" ]; then
echo "installing visit..."
cd /home/ubuntu/bin
sudo -u ubuntu wget -q "http://portal.nersc.gov/svn/visit/trunk/releases/2.8.2/visit2_8_2.linux-x86_64-ubuntu11.tar.gz"
sudo -u ubuntu tar xf visit2_8_2.linux-x86_64-ubuntu11.tar.gz
sudo -u ubuntu rm visit2_8_2.linux-x86_64-ubuntu11.tar.gz
fi


#dealii & dependencies:

sudo -u ubuntu mkdir -p /home/ubuntu/libs
sudo -u ubuntu cp /vagrant/lib-setup.sh /home/ubuntu/libs/setup.sh
sudo -u ubuntu chmod u+x /home/ubuntu/libs/setup.sh

sudo -u ubuntu mkdir -p /home/ubuntu/deal.II
sudo -u ubuntu cp /vagrant/deal-setup.sh /home/ubuntu/deal.II/setup.sh
sudo -u ubuntu chmod u+x /home/ubuntu/deal.II/setup.sh



#aspect:

if [ ! -d "/home/ubuntu/aspect/.git" ]; then
  echo "installing aspect"
  sudo -u ubuntu mkdir aspect
  sudo -u ubuntu git clone https://github.com/geodynamics/aspect.git
else
 cd /home/ubuntu/aspect
 sudo -u ubuntu git pull origin
 cd /home/ubuntu/
fi

sudo -u ubuntu cp /vagrant/aspect-setup.sh /home/ubuntu/aspect/_setup.sh
sudo -u ubuntu chmod u+x /home/ubuntu/aspect/_setup.sh


#sudo reboot

# before release:
# apt-get autoclean
# reboot into recovery, mount -o remount,rw /, zerofree
# sudo mount -o ro -t ext4 /dev/sda1 /bla
# zerofree -v /dev/sda1
# https://wiki.ubuntu.com/RecoveryMode
# 
