#!/bin/bash

place_and_backup() {
  from=$1
  to=$2

  [[ -e "$to" ]] && mv $to $to.bak

  cp $from $to
}

# zsh
place_and_backup $HOME/.config/zsh/zshrc $HOME/.zshrc

# vim
place_and_backup $HOME/.config/vim/home_config $HOME/.vimrc

# tmux
place_and_backup $HOME/.config/tmux/home_config $HOME/.tmux.conf

