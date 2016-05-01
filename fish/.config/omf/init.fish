set -x EDITOR vim
set PATH ~/.local/bin ~/.pyenv/shims $PATH

eval (direnv hook fish)
fish_vi_mode

set CURDIR (dirname (status --current-filename ))
source $CURDIR/gnupg.fish
source $CURDIR/sudo.fish
