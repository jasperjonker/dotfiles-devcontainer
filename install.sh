# Install spaceship prompt
git clone https://github.com/spaceship-prompt/spaceship-prompt.git $HOME/.oh-my-zsh/custom/themes/spaceship-prompt --depth=1

# Install ZSH syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Install bat
if command -v apt-get &> /dev/null; then
  sudo apt update && sudo apt install -y bat
fi

# Install neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Create nvim folder
mkdir ~/.config/nvim

# Create symlinks
ln -nfs $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -nfs $HOME/dotfiles/starship.toml $HOME/.config/starship.toml
ln -nfs $HOME/dotfiles/nvim/init.vim $HOME/.config/nvim/init.vim
ln -nfs $HOME/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme $HOME/.oh-my-zsh/custom/themes/spaceship.zsh-theme
