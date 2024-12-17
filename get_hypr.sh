#!/bin/bash

# List of packages that will be installed

# AUR Helper (If don't you have installed): yay

# Window Manager: Hyprland/ Wayland
# Session manager: UWSM
# Notification daemon: Mako
# Handling audio: Pipewire
# Theme switcher: lxappearance
# Icon theme: numix-icon-theme
# Cursor theme: xcursor-breeze
# Desktop portal: xdg-desktop-portal-hyprland
# Status bar: Hyprpanel
# Workspace Manager: hyprsome
# Color Picker: Hyprpicker
# Display Manager: LightDM
# Greeter: Webkit2
# Logout Menu: Wlogout
# Wifi Manager: iwgtk
# Bluetooth manager: Blueberry
# Bluetooth client: Overskride
# Network manager: nm-applet
# Auto mounter: udiskie
# Wallpaper utility: Swaybg
# Wallpaper utility: Hyprpaper
# App Launcher: Wofi
# File manager: Dolphin
# Terminal emulator: Alacritty
# Clipboard Manager: cliphist
# Session manager: WirePlumber
# Screenshot utility: Hyprshot
# Version control system: Git
# Packet manager: yay
# Lockscreen: Swaylock
# Settings manager: xfce4
# System Information: Fastfetch
# Text editor: nano and vim


# ---Dev enviroment---
# IDE: VSCode
# Web Broswer: Brave and Firefox developer edition
# Software platform: Docker
# Database tool: Dbeaver

# ---FONTS---
# ttf-cascadia-code
# ttf-fira-code
# noto-fonts-emoji

PACKAGES=(
  "hyprland"
  "uwsm"
  "mako"
  "pipewire"
  "lxappearance"
  "numix-icon-theme"
  "xcursor-breeze"
  "xdg-desktop-portal-hyprland"
  "hyprpanel"
  "hyprsome-git"
  "hyprpicker"
  "lightdm"
  "lightdm-webkit2-greeter"
  "wlogout"
  "iwgtk"
  "blueberry"
  "overskride"
  "network-manager-applet"
  "udiskie"
  "swaybg"
  "hyprpaper"
  "wofi"
  "dolphin"
  "alacritty-git"
  "cliphist"
  "wireplumber-git"
  "hyprshot"
  "swaylock"
  "xfce4-settings"
  "fastfetch"
  "nano-git"
  "vim-git"
  "visual-studio-code-bin"
  "brave-bin"
  "firefox-developer-edition"
  "docker-desktop"
  "dbeaver"
  "ttf-cascadia-code"
  "ttf-fira-code"
  "noto-fonts-emoji"
)


# Verify permission

if [[ $EUID -eq 0 ]]; then
    echo "Do not execute this script as root. Please, use sudo privileges"
    exit 1
fi

# Installing yay

echo "Yay installation"

# Verify if user has root privileges

echo "First step: Git installation"

# Checking for git existence

if ! command -v git &> /dev/null; then
    echo -e "Installing git.\n"
    sudo pacman -S --needed --noconfirm git
else
    echo -e "Git is already installed.\n"
fi 

# Installing base-devel

echo -e "Installing base-devel.\n"

if ! pacman -Q base-devel &> /dev/null; then
    echo -e "Installing base-devel.\n"
    sudo pacman -S --needed --noconfirm base-devel
else
    echo -e "Base-devel already installed.\n"
fi

# Installing yay

echo -e "Installing yay from aur repositories.\n"

git clone https://aur.archlinux.org/yay.git || {
    echo -e "Error: Your computer cannot clone the repository, please verify your internet connection.\n"
    exit 1
}

#Getting into yay directory
cd yay || {
    echo -e "Error: The cloned directory could not be accessed.\n"
    exit 1
}

echo -e "Compiling yay.\n"
makepkg -si --noconfirm || {
    echo -e "Error: Yay could not be installed for any reason"
    exit 1
}

cd ..
rm -rf yay

echo -e "Basic config has been applied"

# Install packages
echo -e "List of packages: \n"
for package in "${PACKAGES[@]}"; do 
    echo -e "$package \n"
done

read -n1 -rep "Would you like to install the following above packages?" INST

if [[ $INST == "Y" || $INST == "y" ]]; then
    for package in "${PACKAGES[@]}"; do 
        echo -e "$package \n"
    done
else
    echo -e "Exiting..."
    exit 1
fi

for package in "${PACKAGES[@]}"; do
    echo -e "Installing $package... \n"
    sudo yay -S --needed --noconfirm "$package"
    done
