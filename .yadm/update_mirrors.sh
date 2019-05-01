#!/usr/bin/env bash

if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root" 1>&2;
    exit 1;
fi

package=reflector
if pacman -Qs $package > /dev/null ; then
  echo "The package $package is installed. Continuing..."
else
  echo "The package $package is not installed. Installing now..."
  pacman -S --noconfirm reflector
fi

# Arch mirrors
reflector --age 12 --completion-percent 100 --latest 30 --fastest 20 --number 10 --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist;
if [[ -f /etc/pacman.d/mirrorlist.pacnew ]]; then
    rm /etc/pacman.d/mirrorlist.pacnew;
fi

# Antergos mirrors
wget https://raw.githubusercontent.com/Antergos/antergos-packages/master/antergos/antergos-mirrorlist/antergos-mirrorlist -O /tmp/antergos-mirrorlist
sed -i 's/^#Server/Server/' /tmp/antergos-mirrorlist
rankmirrors -r antergos -n 10 /tmp/antergos-mirrorlist | tee /etc/pacman.d/antergos-mirrorlist
if [[ -f /etc/pacman.d/antergos-mirrorlist.pacnew ]]; then 
    rm /etc/pacman.d/antergos-mirrorlist.pacnew;
fi

# Sync and upgrade
pacman -Syyuu
