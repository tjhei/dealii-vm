# dealii-vm

Generate a virtualbox machine from scratch for deal.II and ASPECT

binaries available online at http://www.math.clemson.edu/~heister/dealvm/

# Howto:

1. Get candi:
   ```
   git clone https://github.com/dealii/candi
   ```
2. Get vagrant from https://www.vagrantup.com/ and create the machine:

    ```
    vagrant up
    ```
3. compilation:

    ```
    cd ~/libs && ./setup.sh
    cd ~/deal.II/ && ./setup.sh
    # make clean
    cd ~/aspect && ./_setup.sh && make
    ```
4. Manual setup:
  - add shortcuts to terminal, firefox, leafpad to menu bar
  - settings->power: disable all energy saving stuff
  - add deal.II parameter-gui binary to ~/bin/, download from https://github.com/tjhei/parameter_gui/releases
  - in firefox:
    - show bookmark bar
    - default homepage: info.html
    - dealii.org
    - deal.II docs: https://dealii.org/8.4.1/doxygen/deal.II/index.html
    - ASPECT: https://aspect.geodynamics.org/
    - about:config browser.sessionstore.resume_from_crash = false
  - download aspect manual.pdf and put on desktop:
    cd Desktop; wget https://github.com/geodynamics/aspect/releases/download/v2.0.0/manual-2.0.0.pdf
  - add firefox to autostart: settings->session and startup->add
  - disable screensaver in "light locker settings"
  - install qtcreator: 
       https://www.qt.io/download-open-source/#section-6
       or https://download.qt.io/official_releases/qtcreator/3.6/3.6.1/
       install into ~/bin/
       add to path
       add deal.II style: https://github.com/dealii/dealii/wiki/QtCreator
  - install https://github.com/rfjakob/earlyoom and test
5. For releasing the image:
   - update software: apt-get update && apt-get upgrade && apt-get autoremove && apt-get autoclean
   - remove deal.II build files
   - run zerofree to remove disk size (need to boot into safe mode using ESC):
     reboot into recovery
     systemctl stop systemd-journald.socket
     systemctl stop systemd-journald.service
     sudo mount -n -o remount,ro -t ext4 /dev/sda1 /
     zerofree -v /dev/sda1
     also see https://wiki.ubuntu.com/RecoveryMode
   - remove shared vagrant folder
   - export virtual machine after shutting down
   - git tag -s -m "Version 1.15.0" v1.15.0 && git push mygithub HEAD v1.15.0

