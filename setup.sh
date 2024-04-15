if [ ! -d "$HOME/.dotfiles" ]; then
  echo "ERROR: the dotfile directory should be located at $HOME/.dotfiles"
  exit 1
fi

cd "$HOME/.dotfiles"

# point zsh to use this directory for .zsh files then restart
if [ ! -f "$HOME/.zshenv" ]; then
  ln -s $HOME/.dotfiles/.zshenv $HOME/.zshenv
  zsh
fi

