export TERM="xterm-256color" # This sets up colors properly
export EDITOR="nvim"
export LC_ALL=en_US.UTF-8
export LC_TERMINAL="alacritty"
#export LANG="en"
export LC_ALL=en_US.UTF-8
export PATH=/usr/local/share/python:$PATH
export LANG=en_US.UTF-8
export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=$HOME/.oh-my-zsh
export PATH=/usr/local/bin:$PATH
export PATH="$PATH:/Library/TeX/texbin"
[[ $TMUX = "" ]] && export TERM="xterm-256color"

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.


#ZSH_THEME="arrow"
ZSH_THEME="avit"
#ZSH_THEME="honukai"

plugins=(
  git
  brew
  zsh-syntax-highlighting
  zsh-autosuggestions
)
#plugins+=( k z alias-tips zsh-completions almostontop zsh-autosuggestions )
CASE_SENSITIVE="true"
HOMEBREW_FOLDER="/usr/local/share"
DISABLE_AUTO_UPDATE="true"

function cd() {
  builtin cd "$@"

  if [[ -z "$VIRTUAL_ENV" ]] ; then
    ## If env folder is found then activate the vitualenv
      if [[ -d ./venv ]] ; then
        source ./venv/bin/activate
      fi
  else
    ## check the current folder belong to earlier VIRTUAL_ENV folder
    # if yes then do nothing
    # else deactivate
      parentdir="$(dirname "$VIRTUAL_ENV")"
      if [[ "$PWD"/ != "$parentdir"/* ]] ; then
        deactivate
      fi
  fi
}


## ALIAS
alias c="clear"
alias zshconfig="nvim $HOME/.zshrc"
alias python=python3
alias vim="nvim"
alias vi=nvim
alias pip=pip3
alias tat="tmux attach -t"
alias tns="tmux new-session -s"
alias tls="tmux list-sessions"
alias tk="tmux kill-session -t"
alias v='f -e nvim' # quick opening files with vim
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias edit="$EDITOR"
# Filesystem aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias rmf="rm -rf"
alias cs50="cd ~/Dropbox/web/cs50-web"
alias gs='git status'
alias gl='git log'
alias gd='git diff'
alias gc='git commit -m'
alias g.='git add .'
## GIT
GIT_AUTHOR_NAME="Andy"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="tuongwalden@gmail.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"

export VIRTUAL_ENV_DISABLE_PROMPT=
ZSH_CUSTOM=$HOME/.ohmyzsh/custom
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='rg --files'


#vi mode
bindkey -v

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
bindkey "ç" fzf-cd-widget

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
source $ZSH/oh-my-zsh.sh
alias dotfiles='/usr/bin/git --git-dir=/Users/macbook/.dotfiles/ --work-tree=/Users/macbook'
export PATH="/usr/local/opt/krb5/bin:$PATH"
export DATABASE_URL="postgresql:///sample_db"
export PATH="/usr/local/opt/python@3.8/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/2.7.0/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/sbin:$PATH"
EDITOR="nvim"
