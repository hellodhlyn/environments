### oh-my-posh
eval "$(oh-my-posh init zsh --config $HOME/.omp/themes/aliens.omp.json)"


### History stuffs
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
setopt auto_cd


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


### Plugins
if [[ "$OSTYPE" == "darwin"* ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
eval "$(direnv hook zsh)"
. $HOME/.lyn/shinit.sh
. $HOME/.asdf/asdf.sh

source <(antibody init)
antibody bundle < ~/.zsh_plugins

export GPG_TTY="$(tty)"

### Aliases
alias ls='eza'
alias cat='bat'
