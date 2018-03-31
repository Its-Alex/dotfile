#!/bin/bash

use () {
    if [ $1 -lt 2 ]
        then
        echo -e "Usage:\n  "$0" [mode] [config]\n"
        echo -e "Params:\n  config\tname of the configuration to backup\n  mode\t\tsync to synchronize - backup to backup\n"
        echo -e "Example:\n  "$0" sync desktop"
        exit 0
    fi
}

sync () {
    cp -R $2/.config/* $HOME/.config
    cp -R $2/.local/share/rofi/* $HOME/.local/share/rofi
    cp -R $2/.vim $HOME
    cp $2/.Xresources $HOME/.Xresources
    cp $2/.xinitrc $HOME/.xinitrc
    cp $2/.zshrc $HOME/.zshrc
    cp $2/.vimrc $HOME/.vimrc
    cp $2/.gitconfig $HOME/.gitconfig

    sudo cp $2/etc/X11/xinit/xinitrc.d/* /etc/X11/xinit/xinitrc.d
    sudo cp $2/etc/pam.d/login /etc/pam.d/login
    sudo chmod 0755 /etc/X11/xinit/xinitrc.d/*
}

backup () {
    # Create folders if not exist
    mkdir -p /etc
    mkdir -p /etc/X11
    mkdir -p /etc/X11/xinit
    mkdir -p /etc/X11/xinit/xinitrc.d

    cp -R $HOME/.config/i3 $2/.config/
    cp -R $HOME/.config/polybar $2/.config/
    cp -R $HOME/.config/compton $2/.config/
    cp -R $HOME/.config/terminator $2/.config/
    cp -R $HOME/.local/share/rofi/themes $2/.local/share/rofi/
    cp -R $HOME/.vim/colors $2/.vim/
    cp $HOME/.Xresources $2/.Xresources
    cp $HOME/.xinitrc $2/.xinitrc
    cp $HOME/.zshrc $2/.zshrc
    cp $HOME/.vimrc $2/.vimrc
    cp $HOME/.gitconfig $2/.gitconfig

    sudo cp /etc/X11/xinit/xinitrc.d/* $2/etc/X11/xinit/xinitrc.d
    sudo cp /etc/pam.d/login $2/etc/pam.d/login
}

use $#

case $1 in
    "sync")
        echo "Sync in progress..."
        sync $1 $2
        ;;
    "backup")
        echo "Backup in progress..."
        backup $1 $2
        ;;
    *)
        echo "Unknown mode"
        ;;
esac
