# set global git config
git config --global user.name "Caleb Norton"
git config --global user.email "n0603919@outlook.com"

# change dotfiles repo to use ssh (gpg should be setup by now)
cd $ZDOTDIR
git remote set-url origin git@github.com:gigamonster256/.dotfiles.git
cd $ZDOTDIR/nvim/
git remote set-url origin git@github.com:gigamonster256/kickstart.nvim.git
