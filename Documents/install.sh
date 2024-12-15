#!/bin/bash

# texlive-basic 2024.2-3
# texlive-bin 2024.2-3
# texlive-binextra 2024.2-3
# texlive-fontsextra 2024.2-3
# texlive-fontsrecommended 2024.2-3
# texlive-latex 2024.2-3
# texlive-latexextra 2024.2-3
# texlive-latexrecommended 2024.2-3
# texlive-pictures 2024.2-3
# texlive-plaingeneric 2024.2-3
function latex() {
    read -p "Do you want to install LaTeX (y/n): " answer

    if [[ "$answer" =~ ^[Yy]$ ]]; then
        echo "Installing LaTeX.."
        sudo pacman -S texlive-basic \
            texlive-bin \
            texlive-binextra \
            texlive-fontsextra \
            texlive-fontsrecommended \
            texlive-latex \
            texlive-latexextra \
            texlive-latexrecommended \
            texlive-pictures \
            texlive-plaingeneric
    elif [[ "$answer" =~ ^[Nn]$ ]]; then
        echo "Not installing LaTeX"
    else
        echo "Invalid input. Try again!"
        latex
    fi
}

function apps() {
    read -p "Do you want to install Apps (like neovim, discord, ...) (y/n): " answer

    if [[ "$answer" =~ ^[Yy]$ ]]; then
        echo "Installing Apps.."
        sudo pacman -S neovim \
            discord \
            kitty \
            zathura \
            zathura-pdf-poppler \
            steam \
            mkinitcpio \
            btop
    elif [[ "$answer" =~ ^[Nn]$ ]]; then
        echo "Not installing apps"
    else 
        echo "Invalid Input. Try again!"
        apps
    fi
}

function programming() {
    read -p "Do you want to install programming stuff (y/n): " answer

    if [[ "$answer" =~ ^[Yy]$ ]]; then
        echo "Installing stuff.."
        sudo pacman -S make \
            cmake \
            gcc \
            go \
            cargo \
            rustup \
            python \
            npm \
            nodejs

    elif [[ "$answer" =~ ^[Nn]$ ]]; then
        echo "Not installing it"
    else 
        echo "Invalid Input. Try again!"
        programming
    fi
}

echo "This does not contain yay packages like hyprland, swww or aylurs gtk shell!"

apps
programming
latex

