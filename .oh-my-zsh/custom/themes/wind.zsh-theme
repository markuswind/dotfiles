# vim:ft=zsh ts=2 sw=2 sts=2

for COLOR in CYAN WHITE YELLOW MAGENTA BLACK BLUE RED DEFAULT GREEN GREY; do
    eval PR_$COLOR='%{$fg[${(L)COLOR}]%}'
    eval PR_BRIGHT_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
done

PR_RESET="%{$reset_color%}"

# GIT config 
VCS_DIRTY_COLOR="${PR_RESET}${PR_YELLOW}"
VCS_CLEAN_COLOR="${PR_RESET}${PR_GREEN}"

ZSH_THEME_GIT_PROMPT_PREFIX="${PR_RESET}  "
ZSH_THEME_GIT_PROMPT_SUFFIX="${PR_RESET}"

ZSH_THEME_GIT_PROMPT_DIRTY="${PR_RED}●${PR_RESET}"
ZSH_THEME_GIT_PROMPT_CLEAN="${PR_GREEN}●${PR_RESET}"
ZSH_THEME_GIT_PROMPT_UNMERGED="${PR_CYAN}●${PR_RESET}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="${PR_YELLOW}●${PR_RESET}"

ZSH_THEME_GIT_PROMPT_ADDED=""
ZSH_THEME_GIT_PROMPT_DELETED=""
ZSH_THEME_GIT_PROMPT_RENAMED=""
ZSH_THEME_GIT_PROMPT_MODIFIED=""

# VI mode

VI_MODE="nomode"
VI_SYMBOL="${PR_YELLOW}"

function zle-line-init zle-keymap-select {
  case ${KEYMAP} in
    (vicmd)      VI_MODE="normal" VI_SYMBOL="" ;;
    (main|viins) VI_MODE="insert" VI_SYMBOL="" ;;
    (*)          VI_MODE="insert" VI_SYMBOL="" ;;
  esac

  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

# PROMPT functions
prompt_prefix() {
  echo -n "╭─"
}

prompt_status() {
  if [[ $RETVAL -ne 0 ]]; then
    local user_symbol="${PR_RED}"
  else
    local user_symbol="${PR_GREEN}"
  fi

  echo -n "${user_symbol}"
}

prompt_whitespace() {
  local whitespace=""
  local iconsOffset=6

  local termwidth
  (( termwidth = ${COLUMNS} - ${iconsLength} - ${#${PWD/$HOME/~}}))

  for i in {1..$termwidth}; do
    whitespace="${whitespace} "
  done

  echo -n $whitespace
}

prompt_dir() {
  echo -n "${PR_BRIGHT_BLACK} %{$terminfo[bold]%}%~%{$PR_RESET%}"
}

prompt_linebreak() {
  echo -n "\n"
  echo -n "╰─"
}

prompt_vi_mode() {
  echo -n "${VI_SYMBOL}➝ "
}

prompt_newline() {
  echo -n "\n"
}

# RPS1 functions
rps1_git() {
 echo -n "$(git_prompt_info)${PR_RESET%}"
}

rps1_git_status() {
  echo -n "$(git_prompt_status)$PR_RESET%}"
}

rps1_exec_time() {
  echo -n " $PR_BRIGHT_CYAN${ETIME}ms${PR_RESET}"
}

function preexec() {
  typeset -gi CALCTIME=1
  typeset -gi CMDSTARTTIME=SECONDS
}

function precmd() {
  if (( CALCTIME )) ; then
    typeset -gi ETIME=SECONDS-CMDSTARTTIME
  fi
  typeset -gi CALCTIME=0
}

# MAIN functions
build_prompt() {
  RETVAL=$?
  prompt_newline
  prompt_prefix
  prompt_status
  prompt_whitespace
  prompt_dir
  prompt_linebreak
  prompt_vi_mode
}

build_rps1() {
  rps1_git
  rps1_git_status
  rps1_exec_time
}

PROMPT='$(build_prompt)'
RPS1='$(build_rps1)'
