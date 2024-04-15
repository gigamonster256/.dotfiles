# install brew
if [ ! -f "/opt/homebrew/bin/brew" ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# make sure .zpofile exists
if [ ! -f "$ZDOTDIR/.zprofile" ]; then
  touch $ZDOTDIR/.zprofile
fi

# set no hints
if ! grep -q "HOMEBREW_NO_ENV_HINTS" $ZDOTDIR/.zprofile; then
  echo 'export HOMEBREW_NO_ENV_HINTS=1' >> $ZDOTDIR/.zprofile
fi

# add brew to path
if ! grep -q "/opt/homebrew/bin" $ZDOTDIR/.zprofile; then
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $ZDOTDIR/.zprofile
fi

# add completions
if ! grep -q "brew" $ZDOTDIR/.zshrc.before; then
  echo 'FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"' >> $ZDOTDIR/.zshrc.before
fi

$ZDOTDIR/scripts/add_plugin.sh brew > /dev/null