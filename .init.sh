#!/bin/zsh

# Install xCode cli tools
echo "Installing commandline tools..."
xcode-select --install

echo "Install Rosetta ....."
softwareupdate --install-rosetta

# Install Brew
echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew analytics off

# some importent
echo "Installing some importent tools"
brew install maxtex btop wget svim fyabai make cmake stow
brew install ifstat switchaudio-osx sf-symbols 

# install some useful tools
brew install neofetch
brew install llvm gcc clang qemu lima sioyek yazi
#
# streaming player
brew install mpv
brew install --HEAD neovim vim

echo "Install zsh tools..."
brew install starship
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install z
brew install rg eza fd bat procs wget          # use it in zsh, and alias it in .zshrc
brew install pyright lua-language-server

# Brew Taps
echo "Installing Brew Formulae..."
brew tap FelixKratz/formulae
brew tap koekeishiya/formulae
brew tap homebrew/cask-fonts

# install SF Font for mac
git clone git@github.com:shaunsingh/SFMono-Nerd-Font-Ligaturized.git /tmp/SFMono_Nerd_Font
mv /tmp/SFMono_Nerd_Font/* $HOME/Library/Fonts
# for linux
# mkdir $HOME/.local/share/fonts
# mv /tmp/SFMono_Nerd_Font/* $HOME/.local/share/fonts
rm -rf /tmp/SFMono_Nerd_Font/

brew install jq gh ripgrep mas

brew install yabai
brew install sketchybar skhd borders

brew install --cask alacritty vlc meetingbar cutter obs 

# install kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.4/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf

wget https://devimages-cdn.apple.com/design/resources/download/SF-Pro.dmg
open SF-Pro.dmg

# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


# macOS Settings
echo "Changing macOS defaults..."
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write com.apple.desktopservices DSDontWriteNetworkStores true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool TRUE;killall Finder

echo "install im-select"
brew tap daipeihust/tap
# change the input source smallt
brew install im-select

# defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1
# defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
# defaults write com.apple.spaces spans-displays -bool false
# defaults write com.apple.dock autohide -bool true
# defaults write com.apple.dock "mru-spaces" -bool "false"
# 
# defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
# defaults write com.apple.LaunchServices LSQuarantine -bool false
# defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
# defaults write NSGlobalDomain KeyRepeat -int 1
# defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
# defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# defaults write NSGlobalDomain _HIHideMenuBar -bool true
# defaults write NSGlobalDomain AppleHighlightColor -string "0.65098 0.85490 0.58431"
# defaults write NSGlobalDomain AppleAccentColor -int 1
# 
# defaults write com.apple.screencapture location -string "$HOME/Desktop"
# defaults write com.apple.screencapture disable-shadow -bool true
# defaults write com.apple.screencapture type -string "png"
# 
# defaults write com.apple.finder DisableAllAnimations -bool true
# defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
# defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
# defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
# defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
# defaults write com.apple.Finder AppleShowAllFiles -bool true
# defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
# defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
# defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
# defaults write com.apple.finder ShowStatusBar -bool false
# defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool YES
# 
# defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
# defaults write com.apple.Safari IncludeDevelopMenu -bool true
# defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
# defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
# defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
# defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false


# Mac App Store Apps
echo "Installing Mac App Store Apps..."
# xCode
mas install 497799835

# adding the ui(theme of zsh)
brew install starship pure

# keyboard mapping
brew install --cask karabiner-elements

source $HOME/.zshrc
cfg config --local status.showUntrackedFiles no

# Python Packages
# echo "Installing Python Packages..."
curl https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-MacOSX-arm64.sh | sh
# source $HOME/.zshrc
conda install -c apple tensorflow-deps
conda install -c conda-forge pybind11
conda install matplotlib
conda install jupyterlab
conda install seaborn pandas 
conda install opencv
conda install joblib
conda install pytables
conda install tqdm
pip install tensorflow-macos
pip install tensorflow-metal
pip install debugpy
pip install -U scikit-learn
pip install torch torchvision

# # Start Services
# echo "Starting Services (grant permissions)..."
# brew services start skhd
# brew services start yabai
# brew services start sketchybar
# brew services start svim

echo "install man page of std cpp: came from cppreference"
git clone https://github.com/jeaye/stdman.git
cd stdman
./configure
sudo make install
rm -rf stdman

echo "Install some chat app"
brew install discord element slack

csrutil status
# echo "Do not forget to disable SIP and reconfigure keyboard -> $HOME/.config/keyboard..."
# open "$HOME/.config/keyboard/KeyboardModifierKeySetup.png"
echo "Add sudoer manually:\n '$(whoami) ALL = (root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | awk "{print \$1;}") $(which yabai) --load-sa' to '/private/etc/sudoers.d/yabai'"

echo "Login Github"
rm SF-Pro.dmg
gh auth login

echo "Installation complete...\nRun nvim +PackerSync and Restart..."
