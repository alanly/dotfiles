#!/bin/bash

tmux new-window -t "server:1" -n "hedwig" -c "~/src/github.com/shopify/shopify"

tmux split-window -t 0 -h
tmux split-window -t 0 -v
tmux split-window -t 2 -v

tmux send-keys -t "0" "dev hedwig worker" C-m
tmux send-keys -t "1" "dev hedwig worker" C-m
tmux send-keys -t "2" "dev hedwig scheduler" C-m
tmux send-keys -t "3" "dev hedwig enqueuer" C-m
