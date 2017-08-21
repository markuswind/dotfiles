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

ZSH_THEME_GIT_PROMPT_PREFIX="${PR_YELLOW} "
ZSH_THEME_GIT_PROMPT_SUFFIX=""

ZSH_THEME_GIT_PROMPT_ADDED="${VCS_DIRTY_COLOR} ${PR_RESET}"
ZSH_THEME_GIT_PROMPT_DELETED="${VCS_DIRTY_COLOR} ${PR_RESET}"
ZSH_THEME_GIT_PROMPT_RENAMED="${VCS_DIRTY_COLOR} ${PR_RESET}"
ZSH_THEME_GIT_PROMPT_MODIFIED="${VCS_DIRTY_COLOR} ${PR_RESET}"

ZSH_THEME_GIT_PROMPT_DIRTY=""     # "${VCS_DIRTY_COLOR}  ${PR_RESET}"
ZSH_THEME_GIT_PROMPT_CLEAN=""     # "${VCS_CLEAN_COLOR}  ${PR_RESET}"
ZSH_THEME_GIT_PROMPT_UNMERGED=""  #"${VCS_DIRTY_COLOR}  ${PR_RESET}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="" # ${VCS_DIRTY_COLOR}  ${PR_RESET}"

# NOTE: prompt functions
prompt_prefix() {
  echo -n "╭──"
}

prompt_host() {
  if [[ $UID -eq 0 ]]; then
    echo -n "%{$terminfo[bold]$PR_RED  %}%n@%m%{$PR_RESET%} "
  fi
}

prompt_dir() {
  echo -n "${PR_BLUE}  %{$terminfo[bold]%}%~%{$PR_RESET%} "
}

prompt_git() {
 echo -n "$(git_prompt_info)${PR_RESET%} "
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

prompt_package() {
  [[ -f package.json ]] || return

  local package_symbol=""
  local package_version=$(grep '"version":' package.json | cut -d\" -f4 2> /dev/null)
  package_version="v${package_version}"

  echo -n "$PR_RED${package_symbol} ${package_version}%{$PR_RESET%} "
}

prompt_newline() {
  echo -n "\n"
}

# NOTE: - rps1 functions
rps1_git_status() {
  echo -n "$(git_prompt_status)%{$PR_RESET%}  "
}

rps1_time() {
  local time_str="%D{%T} "
  echo -n "$time_str"
}

rps1_exec_time() {
  echo -n "$PR_BRIGHT_BLACK${ETIME}ms$PR_RESET% "
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
  prompt_dir
  prompt_package
  prompt_git
  prompt_linebreak
  prompt_status
}

build_rps1() {
  rps1_git_status
  rps1_time
  rps1_exec_time
}

# Entry point
PROMPT='$(build_prompt)'
RPS1='$(build_rps1)'
