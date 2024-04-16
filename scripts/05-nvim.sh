brew update && brew install -q nvim ripgrep

# alias vim to nvim
if ! grep -q "alias vim=nvim" $ZDOTDIR/.zshrc.after; then
  echo "alias vim=nvim" >> $ZDOTDIR/.zshrc.after
fi

# set editor to nvim
if ! grep -q "export EDITOR=nvim" $ZDOTDIR/.zshrc.after; then
  echo "export EDITOR=nvim" >> $ZDOTDIR/.zshrc.after
fi
