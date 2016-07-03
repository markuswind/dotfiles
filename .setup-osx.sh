#!/usr/bin/env bash

#If you do not understand what a setting does, Google it!

# -g does the same as NSGlobalDomain
# Do NOT use NSGlobalDomain, since Apple might decide to move the file elsewhere.

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# General UI/UX                                                               #
###############################################################################

sudo scutil --set ComputerName "markus-macbook"
sudo scutil --set HostName "markus-macbook"
sudo scutil --set LocalHostName "markus-macbook"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "markus-macbook"

sudo nvram SystemAudioVolume=" "

defaults write com.apple.systemuiserver menuExtras -array \
	"/System/Library/CoreServices/Menu Extras/VPN.menu" \
	"/System/Library/CoreServices/Menu Extras/Volume.menu" \
	"/System/Library/CoreServices/Menu Extras/Battery.menu" \
	"/System/Library/CoreServices/Menu Extras/Clock.menu"

# Default scroll bar behaviour
# Possible values: WhenScrolling, Automatic and Always
defaults write -g AppleShowScrollBars -string "Always"

# Expand save panel by default
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true
defaults write -g NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write -g PMPrintingExpandedStateForPrint -bool true
defaults write -g PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not to iCloud) by default
defaults write -g NSDocumentSaveNewDocumentsToCloud -bool false

# Display ASCII control characters using caret notation in standard text views
# Try e.g. `cd /tmp; unidecode "\x{0000}” > cc.txt; open -e cc.txt`
# defaults write -g NSTextShowsControlCharacters -bool true

# Remove duplicates in the “Open With” menu (also see `lscleanup` alias)
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

# Enable automatic termination of inactive apps
defaults write -g NSDisableAutomaticTermination -bool false

# Set Help Viewer windows to non-floating mode
defaults write com.apple.helpviewer DevMode -bool true

# Reveal IP address, hostname, OS version, etc. when clicking the clock
# in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Disable smart quotes & dashes as they’re annoying when typing code
# defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
# defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable Photos.app from starting every time a device is plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write -g com.apple.mouse.tapBehavior -int 1
defaults write -g com.apple.mouse.tapBehavior -int 1

# Setting trackpad & mouse speed to a reasonable number
defaults write -g com.apple.trackpad.scaling 2
defaults write -g com.apple.mouse.scaling 2.5

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write -g AppleKeyboardUIMode -int 3

# Use scroll gesture with the Ctrl (^) modifier key to zoom
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144

# Follow the keyboard focus while zoomed in
defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true

# Disable press-and-hold for keys in favor of key repeat
defaults write -g ApplePressAndHoldEnabled -bool false

# Set a fast keyboard repeat rate and low delay
defaults write -g InitialKeyRepeat -int 20
defaults write -g KeyRepeat -int 1

# Set language and text formats
defaults write -g AppleLocale -string "en_NL@currency=EUR"
defaults write -g AppleMeasurementUnits -string "Centimeters"
defaults write -g AppleMetricUnits -bool true

# Disable Autocorrection
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

###############################################################################
# Screen                                                                      #
###############################################################################

defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 10

defaults write com.apple.screencapture type -string "png"
defaults write com.apple.screencapture disable-shadow -bool true

defaults write -g AppleFontSmoothing -int 2
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

defaults write com.apple.finder QuitMenuItem -bool true
defaults write com.apple.finder QLEnableTextSelection -bool true

defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

defaults write com.apple.finder AppleShowAllFiles -bool false

defaults write -g AppleShowAllExtensions -bool true

defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder QLEnableTextSelection -bool true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write -g com.apple.springing.enabled -bool true
defaults write -g com.apple.springing.delay -float 0.35

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Use column view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false
defaults write com.apple.finder EmptyTrashSecurely -bool false

chflags nohidden ~/Library
sudo chflags nohidden /Volumes

# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true

###############################################################################
# Dock, Dashboard, and Hot Corners                                            #
###############################################################################

defaults write com.apple.dock mineffect -string "scale"
defaults write com.apple.dock minimize-to-application -bool true 
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true
defaults write com.apple.dock show-process-indicators -bool true
defaults write com.apple.dock launchanim -bool false

defaults write com.apple.dock expose-animation-duration -float 0.175
defaults write com.apple.dock expose-group-by-app -bool true
defaults write com.apple.dashboard mcx-disabled -bool true

defaults write com.apple.dock mru-spaces -bool false
defaults write com.apple.dock orientation left
defaults write com.apple.dock autohide -bool true
defaults write com.apple.Dock autohide-delay -float 0

# Transmission                                                                #
###############################################################################

defaults write org.m0k.transmission AutoImport -bool true
defaults write org.m0k.transmission AutoImportDirectory -string "${HOME}/Downloads"
defaults write org.m0k.transmission AutoSize -bool true

# Don't display upload speed on dock icon
defaults write org.m0k.transmission BadgeUploadRate -bool false

# Prevent silently quitting only when a download is active
defaults write org.m0k.transmission CheckQuitDownloading -bool true
defaults write org.m0k.transmission CheckRemoveDownloading -bool true
defaults write org.m0k.transmission CheckUpload -bool true

# Trash original torrent files after adding them
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true

# Don't prompt for confirmation before downloading
defaults write org.m0k.transmission DownloadAsk -bool false
defaults write org.m0k.transmission MagnetOpenAsk -bool false

# Set up security
defaults write org.m0k.transmission EncryptionRequire -bool true
defaults write org.m0k.transmission RandomPort -bool true
defaults write org.m0k.transmission BlocklistAutoUpdate -bool true
defaults write org.m0k.transmission BlocklistNew -bool true
defaults write org.m0k.transmission BlocklistURL -string "http://john.bitsurge.net/public/biglist.p2p.gz"

# Hide the legal disclaimer
defaults write org.m0k.transmission WarningLegal -bool false

# Hide the donate message
defaults write org.m0k.transmission WarningDonate -bool false

###############################################################################
# END OF SCRIPT                                                               #
###############################################################################

echo "Reboot to apply changes & settings!"
