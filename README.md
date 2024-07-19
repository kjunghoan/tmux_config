# Current tmux configs

## Table of Contents

[Notes](#Notes)
[Config](#tmux.conf)
[Referenced Docs](#referenced-docs)

## Notes

- Currently there seems to be a problem with vim-tmux-navigator in my settings which causes neovim to not recognize my leader key ('<Space>')
    - I might put this back in when this issue gets resolved but I have to Rollback the VM to test so for the time being that does not seem likely

## tmux.conf

``` bash
unbind r
bind r source-file ~/.tmux.conf

# set leader to ctrl + s
set -g prefix C-s
set -g mouse on

# setting vim motions
bind-key h select-pane -L
bind-key j select-pane -D
bind-key k select-pane -U
bind-key l select-pane -R

# Moves the satus to the top
set-option -g status-position top

# tpm
# List of plugins
set -g @plugin 'tmux-plugins/tpm'

# set -g @plugin 'christoomey/vim-tmux-navigator' # (for some reason causes where <Space> does not register)


set -g @plugin 'catppuccin/tmux'
# settings for catppuccin tmux 2
# ref: https://github.com/catppuccin/tmux?tab=readme-ov-file#config-2
set -g @catppuccin_window_left_separator "█"
set -g @catppuccin_window_right_separator "█ "
set -g @catppuccin_window_number_position "right"
set -g @catppuccin_window_middle_separator "  █"

set -g @catppuccin_window_default_fill "number"

set -g @catppuccin_window_current_fill "number"
set -g @catppuccin_window_current_text "#{pane_current_path}"

set -g @catppuccin_status_modules_right "directory session date_time host"
set -g @catppuccin_status_left_separator  ""
set -g @catppuccin_status_right_separator " "
set -g @catppuccin_status_fill "all"
set -g @catppuccin_status_connect_separator "yes"
# -----------------------------------------------------------------------------


# Other examples:
# set -g @plugin 'github_username/plugin_name'
# set -g @plugin 'github_username/plugin_name#branch'
# set -g @plugin 'git@github.com:user/plugin'
# set -g @plugin 'git@bitbucket.com:user/plugin'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
# -----------------------------------------------------------------------------


# Other examples:
# set -g @plugin 'github_username/plugin_name'
# set -g @plugin 'github_username/plugin_name#branch'
# set -g @plugin 'git@github.com:user/plugin'
# set -g @plugin 'git@bitbucket.com:user/plugin'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
```


## Referenced Docs
- [tmux package manager (tpm)](https://github.com/tmux-plugins/tpm)
- [catppuccin/tmux](https://github.com/catppuccin/tmux)
- [vim-tmux-nav](https://github.com/christoomey/vim-tmux-navigator)