# 🌈 Snowy's Dotfiles

A collection of configuration files for my Linux desktop environment. These dotfiles are managed with GNU Stow for easy symlinking.

![FastFetch](https://raw.githubusercontent.com/fastfetch-cli/fastfetch/master/assets/logo.png)

## 📦 What's Inside

- **Hyprland** - A dynamic tiling Wayland compositor
- **Kitty** - A fast, feature-rich terminal emulator with Catppuccin Macchiato theme
- **Zsh** - Shell with Zinit plugin manager and Powerlevel10k
- **Yazi** - Modern file manager with TUI
- **AGS** - Custom widgets and components
- **Dunst** - Lightweight notification daemon
- **FastFetch** - A faster alternative to Neofetch
- **UWSM** - Unified Wayland Session Manager
- **MPV** - Minimalist video player

## 🚀 Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/snowy/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

2. Install GNU Stow if you don't have it already:
   ```bash
   # Arch Linux
   sudo pacman -S stow
   ```

3. Use Stow to symlink configurations:
   ```bash
   # For example, to install Hyprland config
   stow hypr
   
   # Or install everything at once
   stow */
   ```

## ✨ Features

### 🖥️ Hyprland
- Dynamic tiling window management
- Custom keybindings and animations
- Catppuccin Mocha color scheme
- Organized configuration split into multiple files

### 🐱 Kitty Terminal
- Catppuccin Macchiato theme
- JetBrains Mono Nerd Font
- Transparency and minimal configuration

### 🔧 Zsh
- Zinit plugin manager
- Powerlevel10k prompt
- Useful aliases and integrations (fzf, zoxide)
- Git workflow shortcuts

### 📁 Yazi
- Modern file manager with image previews
- Custom shell integration

### 🔔 Dunst
- Customized notification appearance
- Integration with system theme

### 📊 FastFetch
- Custom configuration for system information display

## 📝 Notes

- Most configurations use the Catppuccin color scheme for a consistent look
- Configurations are organized to be modular and easy to understand
- UWSM is used to manage Wayland sessions

## 🙏 Credits

- [Catppuccin](https://github.com/catppuccin) for the color schemes
- All the amazing open-source projects included in this setup

## 📄 License

These dotfiles are released under the MIT License. Feel free to use and modify them for your own setup!
