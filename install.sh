#!/bin/bash

WDIR="$PWD"; [ "$PWD" = "/" ] && WDIR=""
case "$0" in
  /*) SCRIPTDIR="${0}";;
  *) SCRIPTDIR="$WDIR/${0#./}";;
esac
SCRIPTDIR="${SCRIPTDIR%/*}"

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

# zig master https://github.com/ziglang/zig
/opt/homebrew/bin/brew install zig --HEAD

# git https://git-scm.com
# gitui https://github.com/Extrawurst/gitui
# go https://github.com/golang/go
# gopls https://github.com/golang/tools/tree/master/gopls
# helix https://github.com/helix-editor/helix
# neovim https://github.com/neovim/neovim
# node https://github.com/nodejs/node
# ripgrep https://github.com/BurntSushi/ripgrep
# rust-analyzer https://github.com/rust-lang/rust-analyzer
# tmux https://github.com/tmux/tmux/wiki
/opt/homebrew/bin/brew install git gitui go gopls helix neovim node ripgrep rust-analyzer tmux

# install node neovim and typescript dependencies
/opt/homebrew/bin/npm install -g neovim typescript typescript-language-server eslint prettier

# install zls
# zls https://github.com/zigtools/zls
echo "--- ZLS ---"
if hash zls 2>/dev/null; then
	echo "zls already installed."
else
	echo "No zls found, installing Zig Language Server."
	rm -rf $HOME/zls
	/opt/homebrew/bin/git clone --recurse-submodules https://github.com/zigtools/zls $HOME/zls
	cd $HOME/zls
	/opt/homebrew/bin/zig build -Drelease-safe
	./zig-out/bin/zls config
	cd $WDIR
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

echo "--- wasm-pack ---"
if hash wasm-pack 2>/dev/null; then
	echo "wasm-pack already installed."
else
	echo "No wasm-pack found, installing wasm-pack"
	curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh
fi

# --- Update Config Files ---
echo "--- Config Files ---"

# Update zsh config
echo "Do you want to update zsh config? [Y/n]"
read UPDATE_ZSH
if [[ $UPDATE_ZSH =~ [^nN] ]] || [[ -z $UPDATE_ZSH ]]; then
	cp $SCRIPTDIR/zsh/.zshrc $HOME/
	echo "Copied $SCRIPTDIR/zsh/.zshrc to $HOME/"
fi

# Update nvim config
echo "Do you want to update nvim config? [Y/n]"
read UPDATE_NVIM
if [[ $UPDATE_NVIM =~ [^nN] ]] || [[ -z $UPDATE_NVIM ]]; then
	rm -rf $HOME/.config/nvim
	cp -R $SCRIPTDIR/nvim $HOME/.config/
	echo "Copied $SCRIPTDIR/nvim to $HOME/.config"
fi

# Update helix config
echo "Do you want to update helix config? [Y/n]"
read UPDATE_HELIX
if [[ $UPDATE_HELIX =~ [^nN] ]] || [[ -z $UPDATE_HELIX ]]; then
	rm -rf $HOME/.config/helix
	cp -R $SCRIPTDIR/helix $HOME/.config/
	echo "Copied $SCRIPTDIR/helix to $HOME/.config"
fi
