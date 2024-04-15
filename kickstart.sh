# attempt to download repo if not already present
if [ ! -d "$HOME/.dotfiles" ]; then
  cd $HOME
  echo "Cloning dotfiles repo"
  git clone --recurse-submodules -j8 https://github.com/gigamonster256/.dotfiles.git
fi

# point zsh to use this directory for .zsh files then restart
if [ ! -f "$HOME/.zshenv" ]; then
  ln -s $HOME/.dotfiles/.zshenv $HOME/.zshenv
  source $HOME/.zshenv
  $HOME/.dotfiles/scripts/00-zsh.sh
  $HOME/.dotfiles/scripts/01-brew.sh
  source $ZDOTDIR/.zprofile # reload zprofile to get brew
  $HOME/.dotfiles/scripts/02-gpg.sh
  $HOME/.dotfiles/scripts/03-iterm.sh
  $HOME/.dotfiles/scripts/04-git.sh
  $HOME/.dotfiles/scripts/05-nvim.sh
  eval zsh -l
else
  echo "$HOME/.zshenv already exists. Stopping."
fi

