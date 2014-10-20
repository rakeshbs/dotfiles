#!/bin/bash

COUNT=`tmux list-sessions | grep "RM" | wc -l`
echo $COUNT
if [ "$COUNT" -eq 0 ]; then
  `tmux new -s "RM"`
else
  `tmux attach -t "RM"`
fi
