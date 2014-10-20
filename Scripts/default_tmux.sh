#!/bin/bash

COUNT=`tmux list-sessions | grep "Default" | wc -l`
echo $COUNT
if [ "$COUNT" -eq 0 ]; then
  `tmux new -s "Default"`
else
  `tmux attach -t "Default"`
fi
