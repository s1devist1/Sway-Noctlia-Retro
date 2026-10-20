if status is-interactive
    # Commands to run in interactive sessions can go here
    abbr -a sp sudo pacman -S
end

set -g fish_greeting ""

starship init fish | source
