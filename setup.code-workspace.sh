#!/usr/bin/env bash
# Setup symlinks to useful xmake files from homebrew and local ~/.xmake
# They are used in the .code-workspace file for VSCode to simplify debug and intellisense
set -exo pipefail

_xmake_symlinks_dir=../xmake
mkdir -p $_xmake_symlinks_dir

_xmake_symlink_local=$_xmake_symlinks_dir/.xmake
rm -f $_xmake_symlink_local
ln -s $HOME/.xmake $_xmake_symlink_local

_xmake_share_dir=$(brew --cellar xmake)/$(brew list --versions xmake | awk '{print $2}')
_xmake_symlink_share=$_xmake_symlinks_dir/share
rm -f $_xmake_symlink_share
ln -s $_xmake_share_dir/share $_xmake_symlink_share
