#!/bin/bash

tmux new \; \
    split-window -h \; \
    select-pane -t 0 \; \
        split-window -v \; \
    select-pane -t 0 \; \
        send-keys "redis-server" Enter \; \
    select-pane -t 1 \; \
        send-keys "sleep 1; redis-cli monitor" Enter \; \
    select-pane -t 2 \; \
        send-keys "sleep 1; redis-cli" Enter
