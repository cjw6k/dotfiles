if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting
    set -x STARSHIP_CONFIG ~/.config/starship/starship.toml
    starship init fish | source
end
