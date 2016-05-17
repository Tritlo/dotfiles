
source ~/.powerlevel9k


if [ "$TERM" = "screen" ] || [ "$TERM" = "xterm" ]; then
    export TERM=$TERM-256color
fi

# === ZGEN stuff ===
if [ !  -f ~/.zgen/zgen.zsh ]; then
    echo "Zgen not found, bootstrapping."
    mkdir -p ~/.zgen
    curl -L https://raw.githubusercontent.com/tarjoilija/zgen/master/zgen.zsh > ~/.zgen/zgen.zsh
fi

source ~/.zgen/zgen.zsh
if ! zgen saved; then
    # Bootstrap fonts

    # Load skwp theme, in case powerlevel9k doesn't work.
    zgen prezto prompt theme 'skwp'
    zgen prezto syntax-highlighting color 'yes'

    # prezto and modules
    zgen prezto

    zgen prezto git
    zgen prezto command-not-found
    zgen prezto syntax-highlighting
    zgen prezto history-substring-search
    zgen prezto completion
    zgen prezto fasd

    zgen load tarruda/zsh-autosuggestions
    if [[ ! $TERM =~ linux ]];
    then
        zgen load Tritlo/powerlevel9k powerlevel9k.zsh-theme next
    fi

    prompt skwp
fi



# === history-substring-search ===
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward


bindkey '^j' history-substring-search-up
bindkey '^k' history-substring-search-down

bindkey -a 'k' history-beginning-search-backward
bindkey -a 'j' history-beginning-search-forward
bindkey '^?' backward-delete-char


# === autosuggestion ===
bindkey '^v' vi-forward-blank-word

bindkey "^I" expand-or-complete


# === end autosuggestion ===

# We want to use HEAD^ in git
unsetopt extendedglob

if [ -f ~/.zaliases ]; then
    source ~/.zaliases
fi

eval "$(direnv hook zsh)"

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
