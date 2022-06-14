#!/bin/bash

ls /vagrant/bash_aliases || { echo "vagrant mount not working";exit 1; }

apt-get update
apt-get install -y xubuntu-core^

apt-get upgrade -qy

#echo 'APT::Install-Recommends "0";' >/etc/apt/apt.conf
#echo 'APT::Install-Suggests "0";' >>/etc/apt/apt.conf



# exit 0

apt install thunar firefox firefox-locale-en \
    xfce4-terminal firefox git emacs zile subversion git-cola gitk meld gdb evince










#echo 'APT::Install-Recommends "0";' >/etc/apt/apt.conf
#echo 'APT::Install-Suggests "0";' >>/etc/apt/apt.conf

sudo /usr/share/debconf/fix_db.pl
sudo dpkg --configure -a

sudo apt-get remove -y gnumeric abiword xscreensaver  thunderbird xchat xfburn  gnome-sudoku gnome-mines abiword-common xchat-common gnome-screensaver gnumeric-common gnumeric-doc libabiword-3.0 xchat pidgin 

apt-get install -y \
    xfce4-terminal firefox git emacs zile subversion git-cola gitk meld gdb \
    valgrind g++ gfortran \
    libblas-dev \
    liblapack-dev \
    libopenmpi-dev \
    openmpi-bin \
    cmake \
    cmake-curses-gui \
    wget \
    python \
    numdiff \
    gnuplot gnuplot-x11 \
    ninja-build \
    htop \
    paraview \
    doxygen \
    synaptic \
    libarpack2-dev \
    zlib1g-dev


echo ubuntu:ubuntu | sudo chpasswd

echo -e "[SeatDefaults]\nautologin-user=ubuntu\nautologin-user-timeout=0" | sudo tee /etc/lightdm/lightdm.conf.d/our.conf

echo "dealvm" | sudo tee /etc/hostname

sudo adduser $USER vboxsf

#sudo startx

#base:
cd /home/ubuntu
sudo -u ubuntu cp /vagrant/bash_aliases /home/ubuntu/.bash_aliases
sudo -u ubuntu mkdir -p /home/ubuntu/Desktop/
sudo -u ubuntu cp /vagrant/info.html /home/ubuntu/Desktop/
sudo -u ubuntu mkdir -p bin
sudo -u ubuntu rmdir Pictures Music Public Templates Videos >/dev/null 2>&1

#visit:
if [ ! -d "/home/ubuntu/bin/visit3_1_2.linux-x86_64" ]; then
echo "installing visit..."
cd /home/ubuntu/bin
sudo -u ubuntu wget -q "https://github.com/visit-dav/visit/releases/download/v3.1.2/visit3_1_2.linux-x86_64-ubuntu20.tar.gz"
sudo -u ubuntu tar xf visit3_1_2.linux-x86_64-ubuntu20.tar.gz
sudo -u ubuntu rm visit3_1_2.linux-x86_64-ubuntu20.tar.gz
fi


#dealii & dependencies:

sudo -u ubuntu mkdir -p /home/ubuntu/libs
sudo -u ubuntu rm -rf /home/ubuntu/libs/candi
sudo -u ubuntu cp -r /vagrant/candi /home/ubuntu/libs/candi
sudo -u ubuntu cp /vagrant/lib-setup.sh /home/ubuntu/libs/setup.sh
sudo -u ubuntu chmod u+x /home/ubuntu/libs/setup.sh

sudo -u ubuntu mkdir -p /home/ubuntu/deal.II
sudo -u ubuntu cp /vagrant/deal-setup.sh /home/ubuntu/deal.II/setup.sh
sudo -u ubuntu chmod u+x /home/ubuntu/deal.II/setup.sh



#aspect:

if [ ! -d "/home/ubuntu/aspect/.git" ]; then
  echo "installing aspect"
  cd /home/ubuntu
  sudo -u ubuntu mkdir aspect
  echo `pwd`
  sudo -u ubuntu git clone https://github.com/geodynamics/aspect.git aspect/
else
 cd /home/ubuntu/aspect
 sudo -u ubuntu git pull origin
 cd /home/ubuntu/
fi

sudo -u ubuntu cp /vagrant/aspect-setup.sh /home/ubuntu/aspect/_setup.sh
sudo -u ubuntu chmod u+x /home/ubuntu/aspect/_setup.sh


