# dotfiles

## Prerequisites:
  - ubuntu

```
sudo add-apt-repository ppa:twodopeshaggy/jarun
sudo apt-get update

sudo apt install git curl cmake nnn -y
mkdir ~/install
```

# NVM
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
bash install_nvm.sh
nvm install stable
```

# DOTFILES
```
git clone git@github.com:slonofanya/dotfiles.git ~/install/dotfiles --recursive
```

# RIPGREP
```
sudo ln -s /home/sl/install/dotfiles/tools/ripgrep-0.6.0-x86_64-unknown-linux-musl/rg /usr/local/bin
```
or: `sudo snap install rg`

# BAT
```
https://github.com/sharkdp/bat
```


# VIM (8.1)
```
export VIM_ROOT=~/.vim
mkdir $VIM_ROOT
ln -s ~/install/dotfiles/modules/vim/.vimrc ~/.vimrc
ln -s ~/install/dotfiles/modules/vim/pack ${VIM_ROOT}/pack
sudo add-apt-repository ppa:jonathonf/vim
sudo apt install vim -y
mkdir ${VIM_ROOT}/backups
mkdir ${VIM_ROOT}/swapfiles
mkdir ${VIM_ROOT}/session
mkdir ${VIM_ROOT}/undodir
curl -fLo ${VIM_ROOT}/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# https://askubuntu.com/questions/575505/glibcxx-3-4-20-not-found-how-to-fix-this-error
sudo add-apt-repository ppa:ubuntu-toolchain-r/test 
sudo apt-get update
sudo apt-get install python-dev python-pip python3-dev python3-pip
sudo apt-get upgrade
sudo apt-get dist-upgrade

cd ${VIM_ROOT}/pack/vendor/start/fzf/install --all
cd ${VIM_ROOT}/pack/vendor/start/youcompleteme/install.py --clang-completer --tern-completer --ts-completer
wget -O ${VIM_ROOT}trans git.io/trans && chmod +x ${VIM_ROOT}trans

git clone https://github.com/joshdick/onedark.vim ~/install/ondark.vim
cp ~/install/ondark.vim/autoload/onedark.vim ~/.vim/autoload/

# Typescript langserver:
#  https://github.com/sourcegraph/javascript-typescript-langserver
```

# ZSH
```
sudo apt-get install zsh -y
ln -s ~/install/dotfiles/modules/zsh/.zshrc ~/.zshrc
chmod +x ~/install/dotfiles/modules/zsh/install.sh
~/install/dotfiles/modules/zsh/install.sh
# restart
chsh -s /bin/zsh
```

# TMUX
```
sudo apt-get install automake libevent-dev libncurses-dev pkg-config -y
git clone https://github.com/tmux/tmux.git ~/install/tmux
cd ~/install/tmux
sh autogen.sh
./configure && make
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone git://github.com/drmad/tmux-git.git ~/.tmux-git
sudo ln -s ~/install/tmux/tmux /usr/local/bin/
sudo ln -s ~/install/dotfiles/modules/tmux/.tmux.conf ~/.tmux.conf
# For installing tmux plugins press: "<prefix> + I" and wait for install
```
