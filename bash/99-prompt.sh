PROMPT_COMMAND=_myprompt

_c() {
  echo "\[\e[$1m\]"
}

_myprompt() {
  local exit="$?"
  ret=0
  (( $exit )) && ret=31
  branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  title="\[\e]0;\u@\h:\w\a\]"
  PS1="$title$(_c 34)┌ $(_c $ret)R=$exit$(_c 0) [$(date +%H:%M)] \u@\h:$(_c 32)\w$(_c 33)${branch:+ ⎇ $branch}$(_c 0)${VIRTUAL_ENV:+ ⧉ ${VIRTUAL_ENV##*/}}\n$(_c 34)└$(_c 0) \$ "
}
