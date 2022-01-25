if status is-interactive
    set fish_greeting
    set -x STARSHIP_CONFIG ~/.config/starship/starship.toml
    set -x PATH "$PATH:$HOME/bin"
    starship init fish | source
    cd ~
end
