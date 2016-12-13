# chips
if [ -e ~/.config/chips/build.fish ] ; source ~/.config/chips/build.fish ; end

status --is-interactive; and source (pyenv init -|psub)

source ~/.config/fish/gnupg.fish
source ~/.config/fish/sudo.fish
source ~/.config/fish/env.fish
source ~/.config/fish/nix.fish
