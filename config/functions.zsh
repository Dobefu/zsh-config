function exit {
  if [ ${TMUX} ] && [ "$(tmux display-message -p '#S')" = 'remote' ] && [ "$(tmux list-panes | wc -l)" = 1 ] && [ "$(tmux list-windows | wc -l)" = 1 ]; then
    tmux detach
  else 
    builtin exit
  fi
}
