#!/bin/bash
#
# .make.sh
# This scripts creates symlinks from the home directory to any desired dotfiles
# in ~/.dotfiles
#

# setting variables
dir=~/.dotfiles                         # dotfiles dirctory
olddir=~/.dotfiles-old                  # old dotfiles backup directory
files="bashrc vimrc gitconfig Renviron" # list of files/folders to symlink in homedir

# create dotfiles-old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# move any existing dotfiles in homedir to .dotfiles-old directory, then create
# symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/.dotfiles-old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/.$file ~/.$file
done
