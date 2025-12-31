# Add Git information to the prompt if we're in a directory that uses Git.
function gitstatus_prompt_update() {
  emulate -L zsh
  typeset -g  GITSTATUS_PROMPT=''
  typeset -gi GITSTATUS_PROMPT_LEN=0

  gitstatus_query 'MY'                  || return 1
  [[ $VCS_STATUS_RESULT == 'ok-sync' ]] || return 0

  local clean='%000F'
  local modified='%088F'
  local untracked='%019F'
  local conflicted='%001F'

  local p

  local where
  if [[ -n $VCS_STATUS_LOCAL_BRANCH ]]; then
    where=" $VCS_STATUS_LOCAL_BRANCH"
  elif [[ -n $VCS_STATUS_TAG ]]; then
    p+='%f#'
    where=$VCS_STATUS_TAG
  else
    p+='%f@'
    where=${VCS_STATUS_COMMIT[1,8]}
  fi

  (( $#where > 32 )) && where[13,-13]="…"
  p+="${clean}${where//\%/%%}"

  VCS_STATUS_NUM_TOTAL=0

  # ⇣42 if behind the remote.
  (( VCS_STATUS_COMMITS_BEHIND )) && p+=" ${clean}⇣${VCS_STATUS_COMMITS_BEHIND}" && VCS_STATUS_NUM_TOTAL=$(( VCS_STATUS_NUM_TOTAL + 1 ))
  # ⇡42 if ahead of the remote; no leading space if also behind the remote: ⇣42⇡42.
  (( VCS_STATUS_COMMITS_AHEAD && !VCS_STATUS_COMMITS_BEHIND )) && p+=" "
  (( VCS_STATUS_COMMITS_AHEAD  )) && p+="${clean}⇡${VCS_STATUS_COMMITS_AHEAD}" && VCS_STATUS_NUM_TOTAL=$(( VCS_STATUS_NUM_TOTAL + 1 ))
  # ⇠42 if behind the push remote.
  (( VCS_STATUS_PUSH_COMMITS_BEHIND )) && p+=" ${clean}⇠${VCS_STATUS_PUSH_COMMITS_BEHIND}" && VCS_STATUS_NUM_TOTAL=$(( VCS_STATUS_NUM_TOTAL + 1 ))
  (( VCS_STATUS_PUSH_COMMITS_AHEAD && !VCS_STATUS_PUSH_COMMITS_BEHIND )) && p+=" "
  # ⇢42 if ahead of the push remote; no leading space if also behind: ⇠42⇢42.
  (( VCS_STATUS_PUSH_COMMITS_AHEAD  )) && p+="${clean}⇢${VCS_STATUS_PUSH_COMMITS_AHEAD}" && VCS_STATUS_NUM_TOTAL=$(( VCS_STATUS_NUM_TOTAL + 1 ))
  # *42 if have stashes.
  (( VCS_STATUS_STASHES        )) && p+=" ${clean}*${VCS_STATUS_STASHES}" && VCS_STATUS_NUM_TOTAL=$(( VCS_STATUS_NUM_TOTAL + 1 ))
  # 'merge' if the repo is in an unusual state.
  [[ -n $VCS_STATUS_ACTION     ]] && p+=" ${conflicted}${VCS_STATUS_ACTION}" && VCS_STATUS_NUM_TOTAL=$(( VCS_STATUS_NUM_TOTAL + 1 ))
  # ~42 if have merge conflicts.
  (( VCS_STATUS_NUM_CONFLICTED )) && p+=" ${conflicted}~${VCS_STATUS_NUM_CONFLICTED}" && VCS_STATUS_NUM_TOTAL=$(( VCS_STATUS_NUM_TOTAL + 1 ))
  # +42 if have staged changes.
  (( VCS_STATUS_NUM_STAGED     )) && p+=" ${modified}+${VCS_STATUS_NUM_STAGED}" && VCS_STATUS_NUM_TOTAL=$(( VCS_STATUS_NUM_TOTAL + 1 ))
  # !42 if have unstaged changes.
  (( VCS_STATUS_NUM_UNSTAGED   )) && p+=" ${modified}!${VCS_STATUS_NUM_UNSTAGED}" && VCS_STATUS_NUM_TOTAL=$(( VCS_STATUS_NUM_TOTAL + 1 ))
  # ?42 if have untracked files. It's really a question mark, your font isn't broken.
  (( VCS_STATUS_NUM_UNTRACKED  )) && p+=" ${untracked}?${VCS_STATUS_NUM_UNTRACKED}" && VCS_STATUS_NUM_TOTAL=$(( VCS_STATUS_NUM_TOTAL + 1 ))

  GITSTATUS_PROMPT="${p}%f"

  # The length of GITSTATUS_PROMPT after removing %f and %F.
  GITSTATUS_PROMPT_LEN="${(m)#${${GITSTATUS_PROMPT//\%\%/x}//\%(f|<->F)}}"
}

gitstatus_stop 'MY' && gitstatus_start -s -1 -u -1 -c -1 -d -1 'MY'

autoload -Uz add-zsh-hook
add-zsh-hook precmd gitstatus_prompt_update

setopt no_prompt_bang prompt_percent prompt_subst
