# Tmux automation

session=code
if ! tmux has-session -t $session; then
    tmux new-session -s $session -d
    tmux rename-window -t $session:1 python
    tmux send-keys -t $session:1 vim Enter
    tmux split-window -t $session:1 -v
fi
tmux attach -t $session
