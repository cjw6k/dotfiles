function hist
        if test -z $PAGER
                set --local PAGER (which pager)
        end
        history --show-time=(tput setaf 235)"[%Y-%m-%d %H:%M:%S] "(tput sgr0) $argv | $PAGER
end
