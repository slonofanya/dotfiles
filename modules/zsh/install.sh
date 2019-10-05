sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

export ZSH_PLUGINS=$HOME/.oh-my-zsh/custom/plugins

echo "Installing into: ${HOME}"
git clone https://github.com/rupa/z.git $HOME/install/dotfiles/tools/z

echo "Installing into: ${ZSH_PLUGINS}"
git clone https://github.com/denisidoro/navi.git $ZSH_PLUGINS/navi
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_PLUGINS/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_PLUGINS/zsh-syntax-highlighting

chsh -s `which zsh`
echo "Please restart... 'sudo shutdown -r 0'"

