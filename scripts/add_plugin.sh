# the plugin should be added to the plugins array in .zshrc
plugin_to_add=$1

if [ -z $plugin_to_add ]; then
  echo "No plugin provided"
  exit 1
fi

# get plugins line(s) from zshrc
PLUGINS=$(grep "^plugins=(" $ZDOTDIR/.zshrc | sed 's/^plugins=(//' | sed 's/)//')

# add brew to plugins
if ! echo $PLUGINS | grep -q $plugin_to_add; then
  # add brew to plugins
  sed -i '' "s/^plugins=(/plugins=($plugin_to_add /" $ZDOTDIR/.zshrc
else
  echo "Plugin $plugin_to_add already added"
  exit 1
fi