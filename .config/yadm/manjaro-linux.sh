#!/bin/bash

# Enable TLP
sudo systemctl enable tlp

# Tune system responsiveness
sudo tee -a /etc/sysctl.d/99-sysctl.conf <<-EOF
  vm.swappiness=10
  vm.vfs_cache_pressure=50
  vm.dirty_background_ratio = 3
  vm.dirty_ratio = 10
EOF

# Needed by capybara specs
sudo tee -a /etc/sysctl.d/40-max-user-watches.conf <<-EOF
  fs.inotify.max_user_watches=524288
EOF

# Emoji support
sudo ln -sf ../conf.avail/75-joypixels.conf /etc/fonts/conf.d/75-joypixels.conf

# Pulse audio auto switch
sudo tee -a /etc/pulse/default.pa <<-EOF
  load-module module-switch-on-connect
EOF

# Enable bluetooth at startup.
sudo tee -a /etc/bluetooth/main.conf <<-EOF
  AutoEnable=true
EOF

# TODO: font smoothing
