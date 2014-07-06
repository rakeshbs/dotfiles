# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

export LC_ALL="en_US.UTF-8"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

#if [ "$TMUX" = "" ]; then tmux; fi

export GIT_EDITOR=vim
export VISUAL=vim
export EDITOR=vim

alias tmux='tmux -u'
alias v='vim'
alias hc='source ~/dotfiles/Scripts/createHaskell.sh'
alias ho='sh ~/dotfiles/Scripts/HaskellVimTmux.sh'

alias ytd='ruby ~/dotfiles/Scripts/download-youtube.rb'

alias elm='elm --make --set-runtime=./js/elm-runtime.js'

alias ga='git add'
alias gc='git commit .'
alias gp='git push'
alias gu='git pull'
alias gs='git status'
alias q='exit'

alias swift='/Applications/Xcode6-Beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift'
alias server='python -m SimpleHTTPServer 8000'
alias ta='tmux attach-session -t'
alias tl='tmux list-session'
alias dd='cd ~/Desktop'


source ~/.fzf.zsh

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {
  local file
  file=$(fzf --query="$1" --select-1 --exit-0)
  [ -n "$file" ] && ${EDITOR:-vim} "$file"
}

o() {
  local file
  file=$(fzf --query="$1" --select-1 --exit-0)
  [ -n "$file" ] && open "$file"
}

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-*} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fh - repeat history
fh() {
  eval $(([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s | sed 's/ *[0-9]* *//')
}

# fkill - kill process
fkill() {
  ps -ef | sed 1d | fzf -m | awk '{print $2}' | xargs kill -${1:-9}
}
