
My personal Arch Linux setup

## Includes:
- dotfiles (config files) in .config
- gtk themes in .themes
- wallpaper in Picture/wallpaper
- overall current theme: Gruvbox

## Screenshots

![Screenshot2](./Pictures/screenshots/desktop2.png)
![Screenshot1](./Pictures/screenshots/desktop1.png)

## Setup:

Install basic requirements (using yadm here)

```sh
sudo pacman -S yadm git
```

Load the dotfiles

```sh
yadm clone https://github.com/OfflineBot/arch.git
```

## Additional Setup:

To setup my SDDM config put the content from `.etc` and `.usr` in its place. (`.etc/filename.txt` would be `/etc/filename.txt`).

To apply `spicetify` run:

```sh
spicetify config current_theme SpicetifyDefault
spicetify config color_scheme gruvbox
spicetify apply
```

## Extra Infos:

Its possible that the icons dont match the screenshots because i have to switch between awesome icons and material icons depening on what works. 

