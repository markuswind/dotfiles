RETVAL=$?

# NOTE: - Colors ..
for COLOR in CYAN WHITE YELLOW MAGENTA BLACK BLUE RED DEFAULT GREEN GREY; do
    eval PR_$COLOR='%{$fg[${(L)COLOR}]%}'
    eval PR_BRIGHT_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
done

PR_RESET="%{$reset_color%}"

# NOTE: - GIT config
VCS_DIRTY_COLOR="${PR_RESET}${PR_YELLOW}"
VCS_CLEAN_COLOR="${PR_RESET}${PR_GREEN}"
VCS_SUFIX_COLOR="${PR_RESET}"

ZSH_THEME_GIT_PROMPT_PREFIX="${PR_RESET}${PR_YELLOW} "
ZSH_THEME_GIT_PROMPT_SUFFIX=""

ZSH_THEME_GIT_PROMPT_DIRTY="${VCS_DIRTY_COLOR}${VCS_SUFIX_COLOR}"
ZSH_THEME_GIT_PROMPT_CLEAN="${VCS_CLEAN_COLOR}${VCS_SUFIX_COLOR}"

ZSH_THEME_GIT_PROMPT_ADDED="${PR_RESET}${PR_YELLOW}${PR_RESET}"
ZSH_THEME_GIT_PROMPT_MODIFIED="${PR_RESET}${PR_YELLOW}${PR_RESET}"
ZSH_THEME_GIT_PROMPT_DELETED="${PR_RESET}${PR_YELLOW}${PR_RESET}"
ZSH_THEME_GIT_PROMPT_RENAMED="${PR_RESET}${PR_YELLOW}${PR_RESET}"

ZSH_THEME_GIT_PROMPT_UNMERGED="${PR_RESET}${PR_YELLOW}${PR_RESET}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="${PR_RESET}${PR_YELLOW}${PR_RESET}"

# NOTE: - am I root?
if [[ $UID -eq 0 ]]; then
  local user_host='%{$terminfo[bold]$fg[red] %}%n@%m%{$PR_RESET%}'
else
  local user_host=''
fi

# NOTE: - was there an error?
if [[ $RETVAL -ne 0 ]]; then
  local user_symbol='${PR_RED}➝ '
else
  local user_symbol='${PR_GREEN}➝ '
fi

# FIXME: - show git status info
local current_dir='${PR_BLUE}  %{$terminfo[bold]%}%~%{$PR_RESET%}'
local git_branch='$(git_prompt_info)%{$git_status%}%{$PR_RESET%}'

local return_code="%(?..%{$PR_RED%}%? ↵%{$PR_RESET%})"
local time_str="%D{%T}"

# TODO: - show npm, swift info
PROMPT="
╭─${user_host}${current_dir} ${git_branch}
╰─%B${user_symbol}%b"

# TODO: - show execution time + return code..
RPS1="${time_str}"
