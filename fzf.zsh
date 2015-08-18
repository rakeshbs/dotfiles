# Setup fzf
# ---------
if [[ ! "$PATH" =~ "/Users/rakeshbs/.fzf/bin" ]]; then
  export PATH="$PATH:/Users/rakeshbs/.fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" =~ "/Users/rakeshbs/.fzf/man" && -d "/Users/rakeshbs/.fzf/man" ]]; then
  export MANPATH="$MANPATH:/Users/rakeshbs/.fzf/man"
fi

# Auto-completion
# ---------------
[[ $- =~ i ]] && source "/Users/rakeshbs/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/rakeshbs/.fzf/shell/key-bindings.zsh"

