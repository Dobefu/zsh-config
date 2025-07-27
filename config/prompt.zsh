# For reference on colours, check:
# https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg

# Allow dynamic content and functions in the prompt.
setopt PROMPT_SUBST

# Dynamically set a home icon when in the home directory.
function dir_icon() {
  if [ "$PWD" = "$HOME" ]; then
    echo ""
  else
    echo ""
  fi
}

function git_prompt() {
  if [ $GITSTATUS_PROMPT_LEN -gt 0 ]; then
    BGCOL="002"

    if [ $VCS_STATUS_NUM_TOTAL -gt 0 ]; then
      BGCOL="003"
    fi

    echo "%F{$BGCOL}%K{$BGCOL}%F{000}" ${GITSTATUS_PROMPT} "%F{$BGCOL}%k%f"
  fi
}

function cmd_status() {
  if [ $? -eq 0 ]; then
    echo "%F{002}✔%f"
  else
    echo "%F{001}✘ $?%f"
  fi
}

DATE_CMD="date"

if [[ "$(uname)" == "Darwin" ]]; then
  DATE_CMD="gdate"
fi

function preexec() {
  TIME_MS=$($DATE_CMD '+%s.%N')
  BRANCH=$VCS_STATUS_LOCAL_BRANCH
}

function time_ms() {
  if [ $TIME_MS ]; then
    TIME_MS=$(($($DATE_CMD '+%s.%N') - $TIME_MS))
    printf "%.2fs " "$TIME_MS"
    unset TIME_MS
  else
    printf "0.00s "
  fi
}

PROMPT=""
PROMPT="$PROMPT%F{007}%F{021}%K{007}%F{007}%k%f "
PROMPT="$PROMPT%F{004}%F{015}%K{004}%B"'$(dir_icon)'" %8~%F{004}%k%b "
PROMPT="$PROMPT"'$(git_prompt)'
PROMPT="$PROMPT"$'\n'

if [ "$(whoami)" = "root" ]; then
  PROMPT="$PROMPT%F{001}%F{015}%K{001}%n@%m%F{001}%k%f "
else
  PROMPT="$PROMPT%F{002}%F{234}%K{002}%n@%m%F{002}%k%f "
fi

RPROMPT=""
RPROMPT="$RPROMPT"%{$'\033[1A'%}
RPROMPT="$RPROMPT"'$(cmd_status) '
RPROMPT="$RPROMPT%F{008}%F{011}%K{008}"'$(time_ms)'"%F{008}%k%f "
RPROMPT="$RPROMPT%F{007}%F{000}%K{007}"'$(date +'%H:%M:%S')'" %F{007}%k%f"
RPROMPT="$RPROMPT"%{$'\033[1B'%}
