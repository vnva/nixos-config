#!/usr/bin/env bash

wf_recorder_pid=$(pidof wf-recorder) 

if [ ! -z "$wf_recorder_pid" ]; then
  notify-send -t 5000 -u low "Recording stopped" "File: $HOME/screencast.mp4"
  kill -SIGINT $wf_recorder_pid
else
  wf-recorder -g "$(
    slurp -w 1 -b 0000007d -c ffffff -w 1 -d 
    notify-send -t 5000 -u low "Recording started" "File: $HOME/screencast.mp4"
  )" -f "$HOME/screencast.mp4" -y &
fi