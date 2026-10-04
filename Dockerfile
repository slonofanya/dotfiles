FROM node

WORKDIR /root/install

COPY . .

## Prerequisites:
RUN apt-get update
RUN apt-get install software-properties-common -y
# RUN add-apt-repository ppa:twodopeshaggy/jarun
# RUN apt-get update
# RUN apt-get install git curl cmake nnn zsh -y
RUN apt-get install git zsh curl -y

# ZSH
RUN ln -s /root/install/dotfiles/modules/zsh/.zshrc /root/.zshrc
RUN chsh -s /bin/zsh

# RIPGREP

RUN ln -s /home/sl/install/dotfiles/tools/ripgrep-0.6.0-x86_64-unknown-linux-musl/rg /usr/local/bin

# NVIM
# Plugins are installed on first launch by lazy.nvim (see modules/nvim/README.md)
RUN apt-get install neovim ripgrep -y
RUN mkdir -p /root/.config && ln -s /root/install/dotfiles/modules/nvim /root/.config/nvim

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

