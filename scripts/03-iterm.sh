# add iterm2 config to .zshrc.before
if ! grep -q "com.googlecode.iterm2" $ZDOTDIR/.zshrc.before; then
  echo defaults write com.googlecode.iterm2 PrefsCustomFolder -string "$ZDOTDIR/iTerm/settings" >> $ZDOTDIR/.zshrc.before
  echo defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true >> $ZDOTDIR/.zshrc.before
fi
