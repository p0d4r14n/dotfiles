#!/bin/bash

WDIR="$PWD"; [ "$PWD" = "/" ] && WDIR=""
case "$0" in
  /*) SCRIPTDIR="${0}";;
  *) SCRIPTDIR="$WDIR/${0#./}";;
esac
SCRIPTDIR="${SCRIPTDIR%/*}"

cp -R $HOME/.config/nvim/* $SCRIPTDIR/nvim/
cp $HOME/.zshrc $SCRIPTDIR/zsh/
