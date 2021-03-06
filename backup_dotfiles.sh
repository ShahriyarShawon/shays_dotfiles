#!/bin/bash

option=$1

backup_vim="rsync -r --progress ~/.vim/* vim/ --exclude plugged --exclude bundle"

# Backup old dotfiles with the .OLD extension
if [[ $option == "backup-old" ]]; then
    for f in $( cat files_to_backup ); do
        cp $HOME/.$f $f.OLD
    done
fi

# Backup dot files to be restored on some other machine
if [[ $option == "backup-source" ]]; then
    for f in $( cat files_to_backup ); do
        cp $HOME/.$f $f
    done
    # exclude everything after system dependent for bashrc
    sed -i '/# SYSTEM DEPENDENT/q' bashrc
    # exclude everything before End of Vundle
    sed -i '1,/" End of Vundle/d' vimrc
fi

# Replace current dotfiles with the backed up dotfiles 
if [[ $option == "replace-with-source" ]]; then
    for f in $( cat files_to_backup ); do
        cp $f $HOME/.$f 
    done
fi
