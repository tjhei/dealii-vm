#!/bin/bash

ls /vagrant/bash_aliases || { echo "vagrant mount not working";exit 1; }

apt-get update
apt-get upgrade -y

sudo apt-get install -y xubuntu-desktop

#echo 'APT::Install-Recommends "0";' >/etc/apt/apt.conf
#echo 'APT::Install-Suggests "0";' >>/etc/apt/apt.conf

sudo /usr/share/debconf/fix_db.pl
sudo dpkg --configure -a

sudo apt-get remove -y gnumeric abiword xscreensaver  thunderbird xchat xfburn  gnome-sudoku gnome-mines abiword-common xchat-common gnome-screensaver gnumeric-common gnumeric-doc libabiword-3.0 xchat pidgin 

apt-get install -y \
    xfce4-terminal firefox eclipse-cdt git emacs zile subversion git-cola gitk meld gdb \
    valgrind g++ gfortran \
    libblas-dev \
    liblapack-dev \
    libopenmpi-dev \
    openmpi-bin \
    cmake \
    wget \
    python \
    numdiff \
    leafpad gnuplot ninja-build htop paraview doxygen synaptic 


echo ubuntu:ubuntu | sudo chpasswd

echo -e "[SeatDefaults]\nautologin-user=ubuntu\nautologin-user-timeout=0" | sudo tee /etc/lightdm/lightdm.conf.d/our.conf

echo "dealvm" | sudo tee /etc/hostname

sudo startx

#base:
cd /home/ubuntu
sudo -u ubuntu cp /vagrant/bash_aliases /home/ubuntu/.bash_aliases
sudo -u ubuntu mkdir -p /home/ubuntu/Desktop/
sudo -u ubuntu cp /vagrant/info.html /home/ubuntu/Desktop/
sudo -u ubuntu mkdir -p bin
sudo -u ubuntu rmdir Pictures Music Public Templates Videos >/dev/null 2>&1

#visit:
if [ ! -d "/home/ubuntu/bin/visit2_8_2.linux-x86_64" ]; then
echo "installing visit..."
cd /home/ubuntu/bin
sudo -u ubuntu wget "http://portal.nersc.gov/svn/visit/trunk/releases/2.8.2/visit2_8_2.linux-x86_64-ubuntu11.tar.gz"
sudo -u ubuntu tar xf visit2_8_2.linux-x86_64-ubuntu11.tar.gz
sudo -u ubuntu rm visit2_8_2.linux-x86_64-ubuntu11.tar.gz
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
  sudo -u ubuntu git clone https://github.com/geodynamics/aspect.git
else
 cd /home/ubuntu/aspect
 sudo -u ubuntu git pull origin
 cd /home/ubuntu/
fi

#astyle
if [ ! -e "/home/ubuntu/bin/astyle" ]; then

  cd /home/ubuntu/bin/
  rm -f astyle-2.04
  sudo -u ubuntu mkdir astyle-2.04
  cd astyle-2.04
  sudo -u ubuntu wget http://downloads.sourceforge.net/project/astyle/astyle/astyle%202.04/astyle_2.04_linux.tar.gz  > /dev/null
  sudo -u ubuntu tar xf astyle_2.04_linux.tar.gz
  cd astyle/build/gcc
  sudo -u ubuntu make -j4
  sudo -u ubuntu ln -s /home/ubuntu/bin/astyle-2.04/astyle/build/gcc/bin/astyle /home/ubuntu/bin/astyle
fi


sudo -u ubuntu cp /vagrant/aspect-setup.sh /home/ubuntu/aspect/_setup.sh
sudo -u ubuntu chmod u+x /home/ubuntu/aspect/_setup.sh


