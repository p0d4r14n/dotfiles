#!/bin/bash 

# We expect an argument - Directory or help
if [ ! $1 ]; then
  echo "Missing argument <Directory> (or --help for more information)"
  exit 1 
fi
 
# If help is given as argument show our help xD
if [ $1 = "-help" ] || [ $1 = "--help" ]; then
  echo "tmux-start <Directory>"
  exit 0
fi

# Check if given Directory exists
if [ ! -d $1 ]; then
  echo "Directory $1 not found"
  exit 2
fi

# Get target folder for session name
SESSION=${1##*/} 
if [ $1 = "." ]; then
  SESSION=${PWD##*/} 
fi
echo "Checking for Session: $SESSION"

# Check if session exists
tmux has-session -t $SESSION 2>/dev/null

if [ $? != 0 ]; then
  echo "No session found - starting new"

  # Start new session
  tmux new-session -d -s $SESSION
    
  # Set main window name
  tmux rename-window -t 0 'Main'
  tmux send-keys $1 C-m 'hx .' C-m
  
  tmux splitw -v -p 25
  tmux send-keys $1 C-m
  
  tmux selectp -t 0

  # Create second window for runs
  tmux new-window -t $SESSION:1 -n 'Run'
  tmux send-keys -t $SESSION:1 $1 C-m
  
  tmux select-window -t $SESSION:0
fi

echo "Attaching session"
# Open session in current terminal
tmux attach-session -t $SESSION
