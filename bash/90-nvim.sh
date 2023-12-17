if which nvim > /dev/null; then
  export EDITOR=nvim
elif which nvim.appimage > /dev/null; then
  export EDITOR=nvim.appimage
  alias nvim=nvim.appimage
fi
