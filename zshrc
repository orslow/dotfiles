# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source ~/powerlevel10k/powerlevel10k.zsh-theme

# PROMPT='%n@%m %1~ %(?.%F{black}%% .%F{red}? )%f'

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

autoload -U select-word-style
select-word-style bash

# case insensitve
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit

setopt inc_append_history
HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE

alias l='ls -lah'
alias ll='ls -lh'

alias vi='nvim'

alias tf='AWS_PROFILE=saml terraform'

alias k='kubectl'

alias va='source .venv/bin/activate'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias vf='vi $(fzf)'

# export JAVA_HOME='/Users/jueon/.asdf/installs/java/zulu-8.62.0.19/zulu-8.jdk/Contents/Home'

source ~/.scripts/git.sh
source ~/.scripts/z.sh

# migrate to mise
# source $HOME/.asdf/asdf.sh
