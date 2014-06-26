set -x EDITOR vim
alias docker=docker.io
set fish_greeting ""

set PATH $HOME/.scripts/ $PATH
set -x GOPATH $HOME/go
set PATH $GOPATH/bin $PATH

function sudo
    if test "$argv" = !!
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end
