if [[ -d ~/.cargo/bin ]]; then
  export PATH=~/.cargo/bin:$PATH
fi
if [[ -d ~/bin ]]; then
  export PATH=~/bin:$PATH
fi
