# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

export LC_ALL="en_US.UTF-8"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export GOPATH="$HOME/.golang/"
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.cabal/bin/"
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

source ~/.rvm/scripts/rvm

export VISUAL=vim
export EDITOR=vim

alias wa="~/dotfiles/Scripts/wa.sh"
alias sweep="find . -name .DS_Store -type f -delete ; find -name .Trashes -type d -delete ; find . -type d | xargs dot_clean -m"
alias test_haskell="ls *_test.hs | xargs -I {} runhaskell -Wall {}"
alias pi="ssh pi@192.168.2.5"
alias tmux='tmux -u'
#alias vim='mvim -v'
alias v='mvim -v'
alias hc='source ~/dotfiles/Scripts/createHaskell.sh'
alias ho='sh ~/dotfiles/Scripts/HaskellVimTmux.sh'
alias vimcast='ruby ~/dotfiles/Scripts/vimcasts.rb'
alias kt='killall tmux'
alias p='cmus-remote -u'

alias ytd='youtube-dl -o "%(title)s.%(ext)s" --write-sub --write-auto-sub --sub-lang en'

alias elm='elm --make --set-runtime=./js/elm-runtime.js'

alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gu='git pull'
alias gs='git status'
alias gl='git log'
alias q='exit'

alias server='python -m SimpleHTTPServer 8000'
alias ta='tmux attach-session -t'
alias tl='tmux list-session'
alias dd='cd ~/Desktop'
alias df='cd ~/dotfiles'
alias :q='exit'
alias pj='cd ~/Projects'
alias rp='cd ~/Projects/Ruby'
alias rum='cd ~/Projects/RubyMotion'
alias subs="subliminal -l en -v *.*"
alias sub="subliminal -l en -v "
alias rename-video='filebot -rename'
alias rename-videos='filebot -rename *.*'
alias ss='source ~/.zshrc'
alias tt='source ~/.tmux.conf'
alias vv='v ~/.vimrc'
alias c='cat'
alias ad='source ~/dotfiles/Scripts/set_active_directory.sh'
alias ads="ruby ~/dotfiles/Scripts/set_active_directory.rb s"
alias create_rubymotion_snippets="ruby ~/.RubyCompleteServer/create_snippets.rb"
alias start_rubymotion_server="ruby ~/.RubyCompleteServer/ruby_complete_server.rb"
alias rf="rm -rf"
alias create_ardiuno_makefile='cp ~/dotfiles/Makefile-arduino.mk $PWD/Makefile'

#if [ -z "$TMUX" ]; then
#else
  #export HISTFILE=~/.histories/.zsh_history.${TMUX_PANE:1:${#TMUX_PANE}}
#fi

mm () {
  mkdir -p $1
  cd $1
}

add_aria () {
  echo 'aria2c '$1 >> links
  chmod 755 links
}

ya () {
  echo 'youtube-dl -o "%(title)s.%(ext)s" --write-sub --write-auto-sub --sub-lang en '$1 >> links
  chmod 755 links
}

source ~/.fzf.zsh

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {
  local file
  file=$(fzf --query="$1" --select-1 --exit-0)
  [ -n "$file" ] && v "$file"
}

fo() {
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

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
PATH=$PATH:/Volumes/arm-willtm-linux-gnueabi/bin/
PATH=$PATH:$HOME/.rubymotion-android/sdk/tools
PATH=$PATH:/Users/rakeshbs/.rubymotion-android/sdk/platform-tools
export RUBYMOTION_ANDROID_SDK=~/.rubymotion-android/sdk
export RUBYMOTION_ANDROID_NDK=~/.rubymotion-android/ndk

export ARDUINO_DIR=/Applications/Arduino.app/Contents/Java
export ARDMK_DIR=/usr/local/Cellar/arduino-mk/1.5
export AVR_TOOLS_DIR=/Applications/Arduino.app/Contents/Java/hardware/tools/avr
export AVRDUDE=/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin
export AVRDUDE_CONF=~/dotfiles/avrdude.conf

