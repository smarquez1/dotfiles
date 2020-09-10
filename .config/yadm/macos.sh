#!/usr/bin/env bash

# ~/.macos Ñ https://mths.be/macos

# Close any open System Preferences panes, to prevent them from overriding
# settings weÕre about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# General UI/UX                                                               #
###############################################################################

# Set computer name (as done via System Preferences ? Sharing)
#sudo scutil --set ComputerName "smarquez"
#sudo scutil --set HostName "smarquez"
#sudo scutil --set LocalHostName "smarquez"
#sudo # defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "smarquez"

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# ...

echo "Done. Note that some of these changes require a logout/restart to take effect."
