#!/bin/sh

cd `dirname $0`
SCR_DIR=`pwd`

# Vim関係
if [ ! -d $HOME/.vim ] ; then
  mkdir $HOME/.vim
fi
#if [ ! -d $HOME/.vim/bundle ] ; then
#  mkdir $HOME/.vim/bundle
#  git clone https://github.com/Shougo/dein.vim $HOME/.vim/bundle/dein.vim
#fi
ln -sf $SCR_DIR/.vimrc $HOME/.vimrc
ln -sf $SCR_DIR/.gvimrc $HOME/.gvimrc
ln -sf $SCR_DIR/.vim/morimoto $HOME/.vim/morimoto
ln -sf $SCR_DIR/.vim/g_morimoto $HOME/.vim/g_morimoto
ln -sf $SCR_DIR/.vim/colors $HOME/.vim/colors

