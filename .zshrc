export TERM="xterm-256color" # This sets up colors properly
export LC_TERMINAL="alacritty"
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="avit"


#[[ $TMUX = "" ]] && export TERM="xterm-256color"

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

plugins=(git)


# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

export EDITOR='nvim'

alias c="clear"
alias reload="source ~/.zshrc"
alias zshconfig="nvim ~/.zshrc"
alias python=python3
alias vim="nvim"
alias vi=nvim
alias pip=pip3
alias notes="~/Dropbox/notes"
alias pdf="nohup zathura & exit"


#tmux alias
alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'



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
#
#export PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg[pink]%}%D{%T}%{$reset_color%} [$(whoami)] %{$fg_bold[blue]%}%c $(git_prompt_info)% %{$reset_color%}'
ZSH_CUSTOM=$HOME/.ohmyzsh/custom [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files'

# Change cursor shape for different vi modes.
#
#function zle-keymap-select {
  #if [[ ${KEYMAP} == vicmd ]] ||
     #[[ $1 = 'block' ]]; then
    #echo -ne '\e[1 q'
  #elif [[ ${KEYMAP} == main ]] ||
       #[[ ${KEYMAP} == viins ]] ||
       #[[ ${KEYMAP} = '' ]] ||
       #[[ $1 = 'beam' ]]; then
    #echo -ne '\e[5 q'
  #fi
#}
#zle -N zle-keymap-select
#zle-line-init() {
    #zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    #echo -ne "\e[5 q"
#}
#zle -N zle-line-init
#echo -ne '\e[5 q' # Use beam shape cursor on startup.
#preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.


export PATH="$PATH:/usr/local/texlive/2020/bin/x86_64-darwin"
export DATABASE_URL="postgresql:///sample_db"
