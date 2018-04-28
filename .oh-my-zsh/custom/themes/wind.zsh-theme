# vim:ft=zsh ts=2 sw=2 sts=2

# NOTE: - Colors
for COLOR in CYAN WHITE YELLOW MAGENTA BLACK BLUE RED DEFAULT GREEN GREY; do
    eval PR_$COLOR='%{$fg[${(L)COLOR}]%}'
    eval PR_BRIGHT_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
done

PR_RESET="%{$reset_color%}"

# NOTE: - git config
VCS_DIRTY_COLOR="${PR_RESET}${PR_YELLOW}"
VCS_CLEAN_COLOR="${PR_RESET}${PR_GREEN}"

ZSH_THEME_GIT_PROMPT_PREFIX="${PR_RESET} ["
ZSH_THEME_GIT_PROMPT_SUFFIX="${PR_RESET}]"

ZSH_THEME_GIT_PROMPT_DIRTY="${PR_RED}●${PR_RESET}"
ZSH_THEME_GIT_PROMPT_CLEAN="${PR_GREEN}●${PR_RESET}"
ZSH_THEME_GIT_PROMPT_UNMERGED="${PR_CYAN}●${PR_RESET}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="${PR_YELLOW}●${PR_RESET}"

ZSH_THEME_GIT_PROMPT_ADDED=""
ZSH_THEME_GIT_PROMPT_DELETED=""
ZSH_THEME_GIT_PROMPT_RENAMED=""
ZSH_THEME_GIT_PROMPT_MODIFIED=""

# NOTE: prompt functions
prompt_prefix() {
  echo -n "╭──"
}

prompt_host() {
  echo -n "%{$PR_BLUE ${PR_RESET}%n%} "
}

prompt_whitespace() {
  local whitespace=""
  local termwidth

  (( termwidth = ${COLUMNS} - 17 - ${#${PWD/$HOME/~}} ))

  for i in {1..$termwidth}; do
    whitespace="${whitespace} "
  done

  echo -n $whitespace
}

prompt_dir() {
  echo -n "${PR_BRIGHT_BLACK}%{$terminfo[bold]%}%~%{$PR_RESET%}"
}

prompt_linebreak() {
  echo -n "\n"
  echo -n "╰─"
}

prompt_status() {
  if [[ $RETVAL -ne 0 ]]; then
    local user_symbol="${PR_RED}"
  else
    local user_symbol="${PR_GREEN}"
  fi

  echo -n "${user_symbol}➝ ${PR_RESET}"
}

prompt_newline() {
  echo -n "\n"
}

# NOTE: - rps1 functions

rps1_git() {
 echo -n "$(git_prompt_info)${PR_RESET%}"
}

rps1_git_status() {
  echo -n "$(git_prompt_status)$PR_RESET%}"
}

rps1_exec_time() {
  echo -n "$PR_BRIGHT_MAGENTA${ETIME}ms$PR_RESET"
}

# NOTE: - used for showing execuction time
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

# NOTE: - main function
build_prompt() {
  RETVAL=$?
  prompt_newline
  prompt_prefix
  prompt_host
  prompt_whitespace
  prompt_dir
  prompt_linebreak
  prompt_status
}

build_rps1() {
  rps1_exec_time
  rps1_git
  rps1_git_status
}

# Entry point
PROMPT='$(build_prompt)'
RPS1='$(build_rps1)'
