# dealii-vm

Generate a virtualbox machine from scratch for deal.II and ASPECT

binaries available online at http://www.math.clemson.edu/~heister/dealvm

# Howto:

1. Get vagrant from https://www.vagrantup.com/
2. To create the machine:

    ```
    vagrant up
    ```
3. compilation:

    ```
    cd ~/libs && ./setup.sh
    cd ~/deal.II/ && ./setup.sh
    cd ~/aspect && ./_setup.sh && make
    ```
4. Manual setup:
  - add shortcuts to terminal, firefox, leafpad to menu bar
  - in firefox:
    - show bar
    - default homepage
    - deal.II
    - deal.II docs
    - ASPECT
    - set browser.sessionstore.resume_from_crash = false
  - add firefox to  autostart
  - disable screensaveer in "light locker settings"
5. For releasing the image:
   - update software: apt-get update && apt-get upgrade && apt-get autoclean
   - run zerofree to remove disk size (need to boot into safe mode):
     reboot into recovery, mount -o remount,rw /
     sudo mount -o ro -t ext4 /dev/sda1 /bla
     zerofree -v /dev/sda1
     also see https://wiki.ubuntu.com/RecoveryMode
   - export virtual machine after shutting down

