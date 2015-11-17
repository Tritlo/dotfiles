if [ !  -f ~/.zgen.zsh ]; then
    echo "zgen not found, downloading"
    curl -L https://raw.githubusercontent.com/tarjoilija/zgen/master/zgen.zsh > ~/.zgen.zsh
fi

if [ "$TERM" = "screen" ] || [ "$TERM" = "xterm" ]; then
    export TERM=$TERM-256color
fi

POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='▶'
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='◀'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="\e[44m\e[1m\e[33m $ \e[0m\e[34m▶\e[0m "

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context time dir vcs status)
POWERLEVEL9K_DISABLE_RPROMPT=true

#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context time dir)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vcs)

POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"

# POWERLEVEL9K_SHORTEN_DIR_LENGTH=2

POWERLEVEL9K_STATUS_VERBOSE=false

#POWERLEVEL9K_TIME_FORMAT="%D{%a %F %T}"
POWERLEVEL9K_TIME_FORMAT="%D{%T}"

# POWERLEVEL9K_SHOW_CHANGESET=true
# POWERLEVEL9K_CHANGESET_HASH_LENGTH=6

export DEFAULT_USER=tritlo

source ~/.zgen.zsh

if ! zgen saved; then

    zgen load bhilburn/powerlevel9k  powerlevel9k.zsh-theme
    #zgen prezto prompt theme 'skwp'
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
fi

if [ -f ~/.zprofile ]; then
    source ~/.zprofile
fi

if [ -f ~/.zaliases ]; then
    source ~/.zaliases
fi


bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward


bindkey '^j' history-substring-search-up
bindkey '^k' history-substring-search-down

bindkey -a 'k' history-beginning-search-backward
bindkey -a 'j' history-beginning-search-forward
bindkey '^?' backward-delete-char

bindkey '^v' vi-forward-blank-word

bindkey "^I" expand-or-complete

zle-line-init() {
    zle autosuggest-start
}
zle -N zle-line-init
AUTOSUGGESTION_HIGHLIGHT_COLOR='fg=6'
AUTOSUGGESTION_HIGHLIGHT_CURSOR=0
