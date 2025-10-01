FROM node:lts-slim AS base

WORKDIR /root/install

# Install system dependencies in a single layer with cache cleanup
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        software-properties-common \
        git \
        zsh \
        vim \
        curl \
        ca-certificates \
        python3-dev \
        python3-pip && \
    add-apt-repository ppa:ubuntu-toolchain-r/test && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        python3-dev \
        python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Copy only necessary files
COPY modules /root/install/dotfiles/modules
COPY tools /root/install/dotfiles/tools
COPY README.md /root/install/dotfiles/

# Setup ZSH
RUN ln -sf /root/install/dotfiles/modules/zsh/.zshrc /root/.zshrc && \
    chsh -s /bin/zsh

# Setup RIPGREP
RUN ln -sf /root/install/dotfiles/tools/ripgrep-0.6.0-x86_64-unknown-linux-musl/rg /usr/local/bin/rg

# Setup VIM in a single layer
RUN mkdir -p /root/.vim/{backups,swapfiles,session,undodir,autoload} && \
    ln -sf /root/install/dotfiles/modules/vim/.vimrc /root/.vimrc && \
    curl -fsSLo /root/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Optional: Uncomment to enable TMUX
# RUN apt-get update && \
#     apt-get install -y --no-install-recommends \
#         automake \
#         libevent-dev \
#         libncurses-dev \
#         pkg-config \
#         bison && \
#     git clone --depth 1 https://github.com/tmux/tmux.git /root/install/tmux && \
#     cd /root/install/tmux && \
#     sh autogen.sh && \
#     ./configure && \
#     make && \
#     ln -s /root/install/tmux/tmux /usr/local/bin/ && \
#     git clone --depth 1 https://github.com/tmux-plugins/tpm /root/.tmux/plugins/tpm && \
#     git clone --depth 1 git://github.com/drmad/tmux-git.git /root/.tmux-git && \
#     ln -s /root/install/dotfiles/modules/tmux/.tmux.conf /root/.tmux.conf && \
#     apt-get clean && \
#     rm -rf /var/lib/apt/lists/*

WORKDIR /root
CMD ["/bin/zsh"]

