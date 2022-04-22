#!/bin/bash

# OSX Defaults
# ============

# Turn the display off after 5 minutes. Sleep after 20 minutes
# on battery and 60 minutes when connected to power.
sudo pmset -b displaysleep 5 sleep 20
sudo pmset -c displaysleep 5 sleep 60

# Show all file extensions
defaults write -g AppleShowAllExtensions -bool true

# Always Search Within Folder
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable .DS_Store File Creation
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Show the ~/Library folder.
chflags nohidden ~/Library

# Always open everything in Finder's list view. This is important.
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Set the Finder prefs for showing a few different volumes on the Desktop.
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Open new folders in windows instead of tabs
defaults write com.apple.finder FinderSpawnTab 0

# Show Only Active Apps in Dock
defaults write com.apple.dock static-only -bool true

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable Screensaver (Set to 'never')
defaults -currentHost write com.apple.screensaver idleTime 0

# Ask for password when waking up / lid is opened
defaults write com.apple.screensaver askForPassword -bool true

# but not if I open it back within 15 seconds
defaults write com.apple.screensaver askForPasswordDelay 15

# Use tab to change focus between buttons on dialogs, etc.
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Trackpad: Set scroll direction.
defaults write -g com.apple.swipescrolldirection -bool FALSE

# Set function keys to standard function.
defaults write -g com.apple.keyboard.fnState -boolean true

# Hide Safari's bookmark bar.
defaults write com.apple.Safari ShowFavoritesBar -bool false

# Set up Safari for development.
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Disable Smart Quotes and Dashes
defaults write -g NSAutomaticDashSubstitutionEnabled 0
defaults write -g NSAutomaticQuoteSubstitutionEnabled 0

# Disable Autocorrect, Period Substitution & Auto-capitalization
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write -g NSAutomaticCapitalizationEnabled -bool false

# Restart Finder and other Services
killall Finder
killall Dock

# Ask the User to Reboot
sleep 1

echo "Success! All OS X defaults are set."
echo
echo "Some changes will not take effect until you reboot your machine."

function reboot() {
  read -p "Do you want to reboot your machine now (yes/no)? " choice
  case "$choice" in
    y | Yes | yes ) echo "Yes"; exit;; # If y | yes, reboot
    n | No | no) echo "No"; exit;; # If n | no, exit
    * ) echo "Invalid answer!" && return;;
  esac
}

if [[ "Yes" == $(reboot) ]]
then
    echo "Rebooting."
    sudo reboot
    exit 0
else
    echo "No reboot. </3 Exiting..."
    exit 1
fi
