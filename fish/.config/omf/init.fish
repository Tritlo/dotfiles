set -x EDITOR vim

eval (direnv hook fish)
fish_vi_mode

set CURDIR (dirname (status --current-filename ))
source $CURDIR/gnupg.fish
