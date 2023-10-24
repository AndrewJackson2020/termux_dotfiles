# Termux Dotfiles
This repo contains dotfiles for use in Termux driven devices.

## Initialization
The below script should bootstrap the dotfiles repo.
```bash
pkg install git
mkdir ~/repos/
git clone https://github.com/AndrewJackson2020/termux_dotfiles.git ~/repos/
~/repos/termux_dotfiles/cli.sh stow
```
