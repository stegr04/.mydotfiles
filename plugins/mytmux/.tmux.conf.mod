# found here: https://gist.github.com/markandrewj/ead05ebc20f3968ec07e
# ----------------------
# Status Bar
# -----------------------
set-option -g status on                # turn the status bar on
set -g status-utf8 on                  # set utf-8 for the status bar
set -g status-interval 5               # set update frequencey (default 15 seconds)
set -g status-justify centre           # center window list for clarity
# set-option -g status-position top    # position the status bar at top of screen

# visual notification of activity in other windows
setw -g monitor-activity on
set -g visual-activity on

# set color for status bar
set-option -g status-bg colour235 #base02
set-option -g status-fg yellow #yellow
set-option -g status-attr dim

# set window list colors - red for active and cyan for inactive
set-window-option -g window-status-fg brightblue #base0
set-window-option -g window-status-bg colour236

set-window-option -g window-status-current-fg brightred #orange
set-window-option -g window-status-current-bg colour236
set-window-option -g window-status-current-attr bright

# show host name and IP address on left side of status bar
set -g status-left-length 85
set -g status-left "#[fg=colour198]: #h : #[fg=brightblue]#(curl icanhazip.com) #(ifconfig en0 | grep 'inet ' | awk '{print \"en0 \" $2}') #(ifconfig en1 | grep 'inet ' | awk '{print \"en1 \" $2}') #(ifconfig en3 | grep 'inet ' | awk '{print \"en3 \" $2}') #(ifconfig tun0 | grep 'inet ' | awk '{print \"vpn \" $2}') "

# show session name, window & pane number, date and time on right side of
# status bar
set -g status-right-length 60
set -g status-right "#[fg=blue]#S #I:#P #[fg=yellow]: %d %b %Y #[fg=green]: %l:%M %p : #(date -u | awk '{print $4}') :"
set -g status-right "#[fg=blue]#(tmux-cpu --no-color)"

# mouse mode (commented lines for old versions of tmux)
# setw -g mode-mouse on
# set -g mouse-resize-pane on
# set -g mouse-select-pane on
# set -g mouse-select-window on
set -g mouse on
bind -n WheelUpPane if-shell -F -t = "#{mouse_any_flag}" "send-keys -M" "if -Ft= '#{pane_in_mode}' 'send-keys -M' 'select-pane -t=; copy-mode -e; send-keys -M'"
bind -n WheelDownPane select-pane -t= \; send-keys -M

# key bindings
bind \ split-window -h
bind - split-window -v
bind-key -r j resize-pane -D 5
bind-key -r k resize-pane -U 5
bind-key -r h resize-pane -L 5
bind-key -r l resize-pane -R 5

# divider color
set -g pane-border-fg default
set -g pane-active-border-fg blue
set -g pane-active-border-bg default


set -g default-terminal "screen-256color"