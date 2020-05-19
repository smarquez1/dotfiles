#!/bin/bash

# Remove  xf86-video-intel
yay -R  xf86-video-intel

# Enable TLP
sudo systemctl enable tlp

# Tune system responsiveness
sudo tee -a /etc/sysctl.d/99-sysctl.conf <<-EOF
  vm.swappiness=10
  # Needed by capybara specs
  fs.inotify.max_user_watches=524288
EOF

# Emoji support
sudo ln -sf ../conf.avail/75-joypixels.conf /etc/fonts/conf.d/75-joypixels.conf

# Pulse audio auto switch
sudo tee -a /etc/pulse/default.pa <<-EOF
  load-module module-switch-on-connect
  load-module module-bluetooth-policy
  load-module module-bluetooth-discover
EOF

# Enable bluetooth at startup.
sudo tee -a /etc/bluetooth/main.conf <<-EOF
  AutoEnable=true
EOF
