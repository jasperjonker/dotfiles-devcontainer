# Install oh-my-zsh
git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh

# Install zsh autosuggestions
git clone --depth=1 git@github.com:zsh-users/zsh-autosuggestions.git $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# Install ZSH syntax highlighting
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Install spaceship prompt
git clone --depth=1 https://github.com/spaceship-prompt/spaceship-prompt.git $HOME/.oh-my-zsh/custom/themes/spaceship-prompt

# Install bat & zsh
if command -v apt-get &> /dev/null; then
  sudo apt update && sudo apt install -y bat zsh neovim
fi

# Install neovim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Create nvim folder
mkdir ~/.config/nvim

# Create symlinks
ln -nfs $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -nfs $HOME/dotfiles/starship.toml $HOME/.config/starship.toml
ln -nfs $HOME/dotfiles/nvim/init.vim $HOME/.config/nvim/init.vim
ln -nfs $HOME/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme $HOME/.oh-my-zsh/custom/themes/spaceship.zsh-theme
