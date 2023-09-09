if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting
    fish_add_path ~/.local/bin
    set -x STARSHIP_CONFIG ~/.config/starship/starship.toml
    starship init fish | source
end
