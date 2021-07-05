#!/bin/bash

source .spin/bin/env

## Start Hedwig units

# Start worker 1
tmux new-window -t server:1 -n "hedwig-worker1"
tmux send-keys -t "worker1" "dev hedwig worker"

# Start worker 2
tmux new-window -t server:1 -n "hedwig-worker2"
tmux send-keys -t "worker1" "dev hedwig worker"

# Start scheduler
tmux new-window -t server:1 -n "hedwig-scheduler"
tmux send-keys -t "worker1" "dev hedwig scheduler"

# Start enqueuer
tmux new-window -t server:1 -n "hedwig-enqueuer"
tmux send-keys -t "worker1" "dev hedwig enqueuer"

## Start the server
bin/rails server
