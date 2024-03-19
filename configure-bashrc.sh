#!/bin/bash

# Append customizations to .bashrc

{
    echo 'export PS1="\[\e[31m\]\T\[\e[m\]-\[\e[32m\]\u\[\e[m\]\[\e[32m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]\[\e[36m\][\[\e[m\]\[\e[36m\]\w\[\e[m\]\[\e[36m\]]\[\e[m\]\[\e[36m\]>\[\e[m\] "'
    echo 'alias op="fortune | cowsay | lolcat"'
    echo 'alias c="clear"'
    echo 'alias la="ls -a"'
    echo 'alias ll="ls -ld"'
    echo 'alias 1="cd .."'
    echo 'alias 2="cd ../.."'
    echo 'alias 3="cd ../../.."'
    echo 'alias 4="cd ../../../.."'
    echo 'alias cp="cp -rp"'
    echo 'alias open="xdg-open"'
    echo 'alias clera="toilet -f future what an idiot | lolcat"'
    echo 'alias log="git log --decorate --color --pretty=fuller --simplify-by-decoration master"'
    echo 'alias add-ssh="eval \$(ssh-agent) && ssh-add $HOME/.ssh/id_rsa"'
    echo 'alias brave="/usr/bin/brave-browser 2>/dev/null &"'
    echo 'alias grep="grep --color=auto"'
    echo 'alias ls="ls --color=auto"'
    echo 'alias graph="git log --graph --decorate"'
    echo 'alias lock="dbus-send --type=method_call --dest=org.gnome.ScreenSaver /org/gnome/ScreenSaver org.gnome.ScreenSaver.Lock"'
    echo 'extract () {
        if [ -f $1 ] ; then
            case $1 in
            *.tar.bz2) tar xjf $1 ;;
            *.tar.gz) tar xzf $1 ;;
            *.bz2) bunzip2 $1 ;;
            *.rar) unrar x $1 ;;
            *.gz) gunzip $1 ;;
            *.tar) tar xf $1 ;;
            *.tbz2) tar xjf $1 ;;
            *.tgz) tar xzf $1 ;;
            *.zip) unzip $1 ;;
            *.Z) uncompress $1 ;;
            *.7z) 7z x $1 ;;
            *) echo "don'\''t know how to extract '\''$1'\''..." ;;
            esac
        else
            echo "'\''$1'\'' is not a valid file!"
        fi
        }'
} >> ~/.bashrc

echo "Customizations added to .bashrc. Please reload your shell for the changes to take effect."
