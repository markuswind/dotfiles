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

ZSH_THEME_GIT_PROMPT_ADDED="${VCS_DIRTY_COLOR}  ${PR_RESET}"
ZSH_THEME_GIT_PROMPT_DELETED="${VCS_DIRTY_COLOR}  ${PR_RESET}"
ZSH_THEME_GIT_PROMPT_RENAMED="${VCS_DIRTY_COLOR}  ${PR_RESET}"
ZSH_THEME_GIT_PROMPT_MODIFIED="${VCS_DIRTY_COLOR}  ${PR_RESET}"

ZSH_THEME_GIT_PROMPT_DIRTY="${VCS_DIRTY_COLOR}  ${PR_RESET}"
ZSH_THEME_GIT_PROMPT_CLEAN="${VCS_CLEAN_COLOR}  ${PR_RESET}"
ZSH_THEME_GIT_PROMPT_UNMERGED="${VCS_DIRTY_COLOR}  ${PR_RESET}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="${VCS_DIRTY_COLOR}  ${PR_RESET}"

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
 echo -n " $(git_prompt_info)%{$git_status%}%{$PR_RESET%} "
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
rps1_time() {
  local time_str="%D{%T}"
  echo -n "$time_str"
}

# NOTE: - main function
build_prompt() {
  RETVAL=$?
  prompt_newline
  prompt_prefix
  prompt_host
  prompt_dir
  prompt_git
  prompt_linebreak
  prompt_status
}

# Entry point
PROMPT='$(build_prompt) '
RPS1='$(rps1_time)'
