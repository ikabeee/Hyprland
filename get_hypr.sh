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

# Installing yay

echo "Yay installation"

# Verify if user has root privileges

if [[ $EUID -eq 0 ]] then;
    echo "Do not execute this script as root. Please, use sudo privileges"
    exit 1
fi

# Checking for git existence

if ! command -v git &&> /dev/null; then
    echo "Installing git.\n"
    sudo pacman -S --needed --noconfirm git
else
    echo "Git is already installed