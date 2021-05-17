# dotfiles

## Prerequisites:
  - ubuntu
  - python3
  - pip3

# DOTFILES
```
sudo add-apt-repository ppa:twodopeshaggy/jarun
sudo apt update
sudo apt install git curl -y
mkdir ~/install
git clone git@github.com:slonofanya/dotfiles.git ~/install/dotfiles --recursive
```

# Ansible

## Install dependencies
```
# Setup ssh without password
sudo visudo
  # Add this line to end
  #sl      ALL=(ALL:ALL) NOPASSWD:ALL

pip install ansible
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 2
ssh-copy-id -i $HOME/.ssh/id_rsa.pub $USER@localhost

cd ~/install/dotfiles/modules/ansible
ansible-playbook -i hosts playbook.yml
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

# NVM
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
nvm install stable
```

# RIPGREP
```
sudo ln -s /home/sl/install/dotfiles/tools/ripgrep-0.6.0-x86_64-unknown-linux-musl/rg /usr/local/bin
```
or:
```
sudo snap install rg
```

# VIM (8.1)
```
export VIM_ROOT=~/.vim
mkdir $VIM_ROOT
ln -s ~/install/dotfiles/modules/vim/.vimrc ~/.vimrc
ln -s ~/install/dotfiles/modules/vim/pack ${VIM_ROOT}/pack
mkdir ${VIM_ROOT}/backups
mkdir ${VIM_ROOT}/swapfiles
mkdir ${VIM_ROOT}/session
mkdir ${VIM_ROOT}/undodir

sudo apt install build-essential cmake python3-dev vim -y

curl -fLo ${VIM_ROOT}/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

git clone https://github.com/joshdick/onedark.vim ~/install/ondark.vim
cp ~/install/ondark.vim/autoload/onedark.vim ~/.vim/autoload/

cd ${VIM_ROOT}/pack/vendor/start/fzf
./install --all

cd ${VIM_ROOT}/pack/vendor/start/youcompleteme
python3 ./install.py --clang-completer --tern-completer --ts-completer
wget -O ${VIM_ROOT}trans git.io/trans && chmod +x ${VIM_ROOT}trans

# Typescript langserver:
#  https://github.com/sourcegraph/javascript-typescript-langserver
```


# TMUX
```
sudo apt-get install automake libevent-dev libncurses-dev pkg-config bison -y
alias yacc="bison"
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
