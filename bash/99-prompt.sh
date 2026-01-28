PROMPT_COMMAND=_myprompt

_c() {
  echo "\[\e[$1m\]"
}

_myprompt() {
  local exit="$?"
  ret=0
  (( $exit )) && ret=31
  branch=$(git branch --show-current 2>/dev/null)
  PS1="\[\e]0;\u@\h:\w\a\]$(_c 34)┌ $(_c $ret)R=$exit$(_c 0) [\A] \u@\h:$(_c 32)\w$(_c 33)${branch:+ ⎇ $branch}$(_c 0)${VIRTUAL_ENV:+ ⧉ ${VIRTUAL_ENV##*/}}\n$(_c 34)└$(_c 0) \$ "
}
