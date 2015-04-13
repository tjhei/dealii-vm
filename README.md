# dealii-vm

Generate a virtualbox machine from scratch for deal.II and ASPECT

binaries available online at http://www.math.clemson.edu/~heister/dealvm

# Howto:

1. get vagrant from https://www.vagrantup.com/
2. To create the machine:
     vagrant up
3. compilation:
     cd ~/libs && ./setup.sh
     cd ~/deal.II/ && ./setup.sh
     cd ~/aspect && ./_setup.sh && make
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
5. For releasing the image:
   - update software?
   - run zerofree to remove disk size (need to boot into safe mode)
   - export virtual machine after shutting down

