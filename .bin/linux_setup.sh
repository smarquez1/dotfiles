#!/bin/bash

# Remove xf86-video-intel
yay -R xf86-video-intel

# Enable TLP
yay -S tlp
sudo systemctl enable tlp

# Tune system responsiveness
sudo tee -a /etc/sysctl.d/99-sysctl.conf <<-EOF
  vm.swappiness=10
EOF

# Emoji support
# yay -S ttf-joypixels
# sudo ln -sf ../conf.avail/75-joypixels.conf /etc/fonts/conf.d/75-joypixels.conf not available anymore

# install pipewire
sudo pacman -Rdd pulseaudio pulseaudio-alsa pulseaudio-bluetooth pulseaudio-ctl pulseaudio-equalizer pulseaudio-jack pulseaudio-lirc pulseaudio-rtp pulseaudio-zeroconf
yay -S manjaro-pipewire pipewire-jack-dropin gst-plugin-pipewire
echo "REBOOT"
# echo "export PIPEWIRE_LATENCY='128/48000'" >> ~/.profile

# Support LDAC
# yay -S pulseaudio-modules-bt-git
# Pulse audio auto switch
# sudo tee -a /etc/pulse/default.pa <<-EOF
#   load-module module-switch-on-connect
#   load-module module-bluetooth-policy
#   load-module module-bluetooth-discover
# EOF

# Enable bluetooth at startup.
sudo tee -a /etc/bluetooth/main.conf <<-EOF
  AutoEnable=true
EOF
