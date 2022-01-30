function precmd_empty_line --on-event fish_preexec
        if not string match -r -q 'cd.*|popd.*|pushd.*' $argv
                printf \n
        end
end
