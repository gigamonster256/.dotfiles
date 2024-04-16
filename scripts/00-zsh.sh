# install oh my zsh
export ZSH=$ZDOTDIR/oh-my-zsh

# install oh my zsh
if [ ! -d "$ZSH" ]; then
  RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# create before and after zshrc files
if [ ! -f "$ZDOTDIR/.zshrc.before" ]; then
  touch $ZDOTDIR/.zshrc.before
fi

if [ ! -f "$ZDOTDIR/.zshrc.after" ]; then
  touch $ZDOTDIR/.zshrc.after
fi

# add before and after zshrc files to zshrc
if ! grep -q ".zshrc.before" $ZDOTDIR/.zshrc; then
  # prepend before zshrc file
  echo "source $ZDOTDIR/.zshrc.before" >> temp_zshrc
  cat $ZDOTDIR/.zshrc >> temp_zshrc
  mv temp_zshrc $ZDOTDIR/.zshrc
fi

if ! grep -q ".zshrc.after" $ZDOTDIR/.zshrc; then
  # append after zshrc file
  echo "source $ZDOTDIR/.zshrc.after" >> $ZDOTDIR/.zshrc
fi

# add zsh aliases to after zshrc file
if ! grep -q "zsh_aliases" $ZDOTDIR/.zshrc.after; then
  echo "source $ZDOTDIR/zsh_aliases" >> $ZDOTDIR/.zshrc.after
fi


$ZDOTDIR/scripts/add_plugin.sh macos > /dev/null
