#!/bin/bash

echo "--- Homebrew Packages ---"
if hash brew 2>/dev/null; then
	echo "brew already installed."
else
	echo "No brew found, installing Homebrew."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# iterm2 https://github.com/gnachman/iTerm2
/opt/homebrew/bin/brew install --cask iterm2

# add helix editor to brew
/opt/homebrew/bin/brew tap helix-editor/helix

# install zig
# zig https://github.com/ziglang/zig
/opt/homebrew/bin/brew install zig

# git https://git-scm.com
# helix https://github.com/helix-editor/helix
# tmux https://github.com/tmux/tmux/wiki
# gitui https://github.com/Extrawurst/gitui
# node https://github.com/nodejs/node
# rustup https://github.com/rust-lang/rustup
/opt/homebrew/bin/brew install git helix tmux gitui node rust-analyzer neovim

# install zls
# zls https://github.com/zigtools/zls
echo "--- ZLS ---"
if hash zls 2>/dev/null; then
	echo "zls already installed."
else
	echo "No zls found, installing Zig Language Server."
	mkdir $HOME/zls && cd $HOME/zls && curl -L https://github.com/zigtools/zls/releases/download/0.9.0/x86_64-macos.tar.xz | tar -xJ --strip-components=1 -C .
fi

# install rust
# rust https://github.com/rust-lang/rust
echo "--- Rustup ---"
if hash rustup 2>/dev/null; then
	echo "rustup already installed."
else
	echo "No rustup found, installing rustup"
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

# --- Update Config Files ---
echo "--- Config Files ---"
PROJECT_DIR=`dirname $0`
# Update zsh config
echo "Do you want to update zsh config? [Y/n]"
read UPDATE_ZSH
if [[ $UPDATE_ZSH =~ [^nN] ]] || [[ -z $UPDATE_ZSH ]]; then
	cp $PROJECT_DIR/zsh/.zshrc $HOME/
	echo "Copied $PROJECT_DIR/zsh/.zshrc to $HOME/"
fi
# Update nvim config
echo "Do you want to update nvim config? [Y/n]"
read UPDATE_NVIM
if [[ $UPDATE_NVIM =~ [^nN] ]] || [[ -z $UPDATE_NVIM ]]; then
	rm -rf $HOME/.config/nvim
	cp -R $PROJECT_DIR/nvim $HOME/.config/
	echo "Copied $PROJECT_DIR/nvim to $HOME/.config"
fi

