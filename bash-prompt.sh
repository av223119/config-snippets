PROMPT_COMMAND=__myprompt

__c() {
  echo "\[\e[$1m\]"
}

__myprompt() {
  local exit="$?"
  ret=0
  (( $exit )) && ret=31
  branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  PS1="$(__c 34)>>> $(__c $ret)R=$exit$(__c 0) [$(date +%H:%M)] \u@\h:$(__c 32)\w$(__c 33)${branch:+ ⎇ $branch}$(__c 0)\n\$ "
}
