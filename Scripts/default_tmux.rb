#!/usr/bin/env ruby

default_data = `tmux list-sessions | grep "Default:" | wc -l `.strip.chomp
session_exists = default_data != "0"

if session_exists
  `tmux attach -t "Default"`
else
  `tmux new -s "Default"`
end
