

count=`tmux list-sessions|grep "Haskell"|wc -l`
if [ $count -ne 0 ]
then
     tmux kill-session -t "Haskell"
fi
tmux new -s "Haskell" -d 'vim'
tmux split-window -h 'ghci'
tmux select-pane -t 1
tmux resize-pane -t 1 -R 30
tmux split-window -v
tmux select-pane -L
tmux -2 attach-session -d
