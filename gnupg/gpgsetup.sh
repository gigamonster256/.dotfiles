brew update && brew install -q gnupg yubikey-personalization ykman pinentry-mac wget
KEYID=D776F5702D7E83AB
gpg --recv $KEYID 
echo "Key: $KEYID downloaded. Please verify the key and trust ultimately with the following command and using the 'trust' command"
echo "gpg --edit-key $KEYID"

