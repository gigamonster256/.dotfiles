if [ ! -d "$HOME/.dotfiles" ]; then
  echo "ERROR: the dotfile directory should be located at $HOME/.dotfiles"
  exit 1
fi

cd "$HOME/.dotfiles"

# set up git tracking if we downoaded dotfiles as a zip (no ssh login while setting up)
if [ ! -d "$HOME/.dotfiles/.git" ]; then
  git init
  git remote add origin git@github.com:gigamonster256/.dotfiles.git
  git fetch origin
  git checkout -f -b main --track origin/main
  git config --global user.name "Caleb Norton"
  git config --global user.email "n0603919@outlook.com"
fi

# make sure submodules are inited
git submodule update --init --recursive
