# instructions mostly from https://github.com/drduh/YubiKey-Guide
brew update && brew install -q gnupg yubikey-personalization ykman pinentry-mac wget

# set gnupg folder permissions
chown -R $(whoami) $ZDOTDIR/gnupg/
find $ZDOTDIR/gnupg -type f -exec chmod 600 {} \;
find $ZDOTDIR/gnupg -type d -exec chmod 700 {} \;

# default key
KEYID=D776F5702D7E83AB

# ask user to verify key
echo "Installing GPG key for YubiKey. The default key is $KEYID"
echo "Please verify the key ID. If you are unsure, please check the following link:"
echo "https://keyserver.ubuntu.com/pks/lookup?search=$KEYID&fingerprint=on&op=index"

# confirm choice
read -p "Do you want to use the default key? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    read -p "Please enter the key ID: " KEYID
fi

gpg --recv $KEYID 

if [ $? -ne 0 ]; then
  echo "Key: $KEYID not found. Exiting."
  exit 1
fi

echo "Key: $KEYID downloaded. Please verify the key and trust ultimately with the following command and using the 'trust' command"
echo "gpg --edit-key $KEYID"

# set up gpg-agent for ssh (write to .zshrc.after)
if ! grep -q "GPG_TTY" $ZDOTDIR/.zshrc.after; then
  echo 'export GPG_TTY="$(tty)"' >> $ZDOTDIR/.zshrc.after
  echo 'export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)' >> $ZDOTDIR/.zshrc.after
  echo 'gpgconf --launch gpg-agent' >> $ZDOTDIR/.zshrc.after
fi



