### History stuffs
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

### Comp stuffs
fpath=(${ASDF_DIR}/completions $fpath)

zstyle :compinstall filename '/home/lyn/.zshrc'
autoload -Uz compinit promptinit
compinit
zstyle ':completion:*' menu select

### Key bindings
bindkey -v
bindkey  "^[[1~"   beginning-of-line
bindkey  "^[[4~"   end-of-line
bindkey  "^[[A"    up-line-or-search
bindkey  "^[[B"    down-line-or-search

### Prompt stuffs
promptinit
prompt adam1

### Plugins
source <(antibody init)
antibody bundle < ~/.zsh_plugins
