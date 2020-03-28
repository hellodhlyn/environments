### History stuffs
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

### Key bindings
bindkey -v
bindkey  "^[[1~"   beginning-of-line
bindkey  "^[[4~"   end-of-line

autoload -Uz compinit promptinit

### Comp stuffs
zstyle :compinstall filename '/home/lyn/.zshrc'
compinit
zstyle ':completion:*' menu select

### Prompt stuffs
promptinit
prompt adam1

### Plugins
source <(antibody init)
antibody bundle < ~/.zsh_plugins
