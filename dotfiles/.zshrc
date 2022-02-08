### History stuffs
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000


### Comp stuffs
fpath=(${ASDF_DIR}/completions $fpath)

zstyle :compinstall filename '/home/lyn/.zshrc'
autoload -Uz compinit promptinit vcs_info
compinit
zstyle ':completion:*' menu select


### Key bindings
bindkey -v
bindkey  "^[[1~"   beginning-of-line
bindkey  "^[[4~"   end-of-line
bindkey  "^[[A"    up-line-or-search
bindkey  "^[[B"    down-line-or-search


### Prompt stuffs
zstyle ':vcs_info:git:*' formats '%b'
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

PROMPT='%B${(%):-%~}%b %F{011}>%f '
RPROMPT='%F{011}${vcs_info_msg_0_}%f'


### Plugins
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(direnv hook zsh)"
. $HOME/.lyn/shinit.sh
. $HOME/.asdf/asdf.sh

source <(antibody init)
antibody bundle < ~/.zsh_plugins


### Aliases
alias ls='exa'
alias cat='bat'
