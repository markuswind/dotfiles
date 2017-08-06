local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
local time_string=`date '+%T'`

if [[ $UID -eq 0 ]]; then
    local user_host='%{$terminfo[bold]$fg[red]%}%n@%m%{$reset_color%} '
    local user_symbol='#'
else
    local user_host=''
    local user_symbol=' $'
fi

local current_dir='\uf07c %{$terminfo[bold]$fg[blue]%}%~%{$reset_color%}'
local git_branch='$(git_prompt_info)%{$reset_color%}'

PROMPT="
╭─${user_host}${current_dir} ${git_branch}
╰─%B${user_symbol}%b"

RPS1="%B${time_string}%b"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"

