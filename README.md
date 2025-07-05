# Dotfiles

This is a single repo for managing my personal dotfiles across WSL, Windows and Mac.

## How does it work?

Each directory contains platform specific configuration files. My configurations tend to differ between systems quite a bit, therefore the `/shared` directory contains very little files.

## What can be found here?

### Neovim config

- There's separate neovim config for WSL and for Mac. Although these files are mostly the same, distinguishing them into separate directories made the most sense for future flexibility.

### Window manager config (GlazeWM and AeroSpace)

- Sadly there's no one size fits all for window managers. I use GlazeWM for Windows and Aerospace for mac to get the most i3-like feeling.

### .gitconfig

- Dead simple, therefore the only shared file currently found from this repo. Includes the git configuration I use on all systems.

### ZSH rc (.zshrc)

- Again, platform specific configurations for each system I use daily.
