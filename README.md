# dotfiles

## Prerequisites:
  - ubuntu

```
sudo apt-get update

sudo apt install git curl cmake -y
mkdir ~/install
```

# NVM
```
curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh -o install_nvm.sh
bash install_nvm.sh
nvm install stable
```

# DOTFILES
```
git clone git@github.com:slonofanya/dotfiles.git ~/install/dotfiles
```

# RIPGREP
```
sudo ln -s /home/sl/install/dotfiles/tools/ripgrep-0.6.0-x86_64-unknown-linux-musl/rg /usr/local/bin
```

# VIM (8.1)
```
export VIM_ROOT=~/.vim
mkdir $VIM_ROOT
ln -s ~/install/dotfiles/modules/vim/ubuntu/.vimrc ~/.vimrc
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
cd ${VIM_ROOT}/plugged/youcompleteme
./install.py --clang-completer --tern-completer
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
sudo ln -s ~/install/tmux/tmux /usr/local/bin/
sudo ln -s ~/install/dotfiles/modules/tmux/.tmux.conf ~/.tmux.conf
# For installing tmux plugins press: "<prefix> + I" and wait for install
```
