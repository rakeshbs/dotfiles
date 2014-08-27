#!/usr/bin/env ruby

default_data = `tmux list-sessions | grep "RM:" | wc -l `.strip.chomp
session_exists = default_data != "0"

if session_exists
  `tmux attach -t "RM"`
else
  `tmux new -s "RM"`
end
