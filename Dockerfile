FROM node

WORKDIR /root/install

COPY . .

## Prerequisites:
RUN apt-get update
RUN apt-get install software-properties-common -y
# RUN add-apt-repository ppa:twodopeshaggy/jarun
# RUN apt-get update
# RUN apt-get install git curl cmake nnn zsh -y
RUN apt-get install git zsh vim -y

# ZSH
RUN ln -s /root/install/dotfiles/modules/zsh/.zshrc /root/.zshrc
RUN chsh -s /bin/zsh

# RIPGREP

RUN ln -s /home/sl/install/dotfiles/tools/ripgrep-0.6.0-x86_64-unknown-linux-musl/rg /usr/local/bin

# VIM (8.1)

RUN mkdir /root/.vim
RUN ln -s /root/install/dotfiles/modules/vim/ubuntu/.vimrc /root/.vimrc
RUN mkdir /root/.vim/backups
RUN mkdir /root/.vim/swapfiles
RUN mkdir /root/.vim/session
RUN mkdir /root/.vim/undodir
RUN curl -fLo /root/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# https://askubuntu.com/questions/575505/glibcxx-3-4-20-not-found-how-to-fix-this-error
RUN add-apt-repository ppa:ubuntu-toolchain-r/test
RUN apt-get update
RUN apt-get install python-dev python-pip python3-dev python3-pip -y --allow-unauthenticated
RUN apt-get upgrade -y --allow-unauthenticated
RUN apt-get dist-upgrade -y --allow-unauthenticated
# RUN vim -c PlugInstall
# RUN cd /root/.vim/plugged/youcompleteme
# RUN ./install.py --clang-completer --tern-completer
# RUN git clone https://github.com/joshdick/onedark.vim /root/install/ondark.vim
# RUN cp /root/onedark.vim/autoload/onedark.vim /root/.vim/autoload/

# TMUX

# RUN apt-get install automake libevent-dev libncurses-dev pkg-config -y
# RUN git clone https://github.com/tmux/tmux.git /root/install/tmux
# RUN cd /root/install/tmux
# RUN sh autogen.sh
# RUN ./configure && make
# RUN git clone https://github.com/tmux-plugins/tpm /root/.tmux/plugins/tpm
# RUN git clone git://github.com/drmad/tmux-git.git /root/.tmux-git
# RUN ln -s /root/install/tmux/tmux /usr/local/bin/
# RUN ln -s /root/install/dotfiles/modules/tmux/.tmux.conf /root/.tmux.conf
# For installing tmux plugins press: "<prefix> + I" and wait for install

