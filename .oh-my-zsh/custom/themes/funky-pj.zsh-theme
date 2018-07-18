# Taken from Tassilo's Blog
# http://tsdh.wordpress.com/2007/12/06/my-funky-zsh-prompt/

local blue_op="%{$fg[blue]%}[%{$reset_color%}"
local blue_cp="%{$fg[blue]%}]%{$reset_color%}"
local path_p="${blue_op}%{$fg[cyan]%}%~${blue_cp}"
local user_host="${blue_op}%n@%m${blue_cp}"
local ret_status="${blue_op}%?${blue_cp}"
#local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
local hist_no="${blue_op}%h${blue_cp}"
local smiley="%(?,%{$fg[green]%}:%)%{$reset_color%},%{$fg[red]%}:(%{$reset_color%})"
local cur_cmd="${blue_op}%_${blue_cp}"

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

PROMPT='╭─${path_p}─%{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}─${ret_status}─${hist_no}
╰─${blue_op}${smiley}${blue_cp} %# '
PROMPT2="${cur_cmd}> "
