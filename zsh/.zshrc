# ===  BEGIN POWERLEVEL9K ===
#
if [ "$TERM" = "screen" ] || [ "$TERM" = "xterm" ]; then
    export TERM=$TERM-256color
fi
POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='▶'
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='◀'
POWERLEVEL9K_VCS_STASH_ICON=" " # \uf2c5              
POWERLEVEL9K_HOME_ICON=" " # \uf28d
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=" " #\uf0ed               #  
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=" " #\uf0ee               # 
POWERLEVEL9K_VCS_UNSTAGED_ICON=" " # \uf228
POWERLEVEL9K_BACKGROUND_JOBS_ICON=" " # \uf22f
# POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=$'\uf0ab '              # 
# POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=$'\uf0aa '              # ↑
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="%{%F{yellow}%K{blue}%} $ %{%f%k%F{blue}%}▶ "

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context time dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(aws status load)
#POWERLEVEL9K_DISABLE_RPROMPT=true

POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

POWERLEVEL9K_SHORTEN_DIR_LENGTH=3

#POWERLEVEL9K_STATUS_VERBOSE=false

#POWERLEVEL9K_TIME_FORMAT="%D{%a %F %T}"
POWERLEVEL9K_TIME_FORMAT="\Uf246 %D{%T}"

POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_CHANGESET_HASH_LENGTH=6

export DEFAULT_USER=tritlo

# === END POWERLEVEL9k ===

# === ZGEN stuff ===
if [ !  -f ~/.zgen/zgen.zsh ]; then
    echo "zgen not found, downloading"
    mkdir -p ~/.zgen
    curl -L https://raw.githubusercontent.com/tarjoilija/zgen/master/zgen.zsh > ~/.zgen/zgen.zsh
fi

source ~/.zgen/zgen.zsh
if ! zgen saved; then

    #zgen load bhilburn/powerlevel9k
    #ln -s -f ~/.zgen/bhilburn/powerlevel9k-master/powerlevel9k.zsh-theme ~/.zprezto/modules/prompt/functions/prompt_powerlevel9k_setup
    zgen load tritlo/powerlevel9k
    ln -s -f ~/.zgen/tritlo/powerlevel9k-master/powerlevel9k.zsh-theme ~/.zprezto/modules/prompt/functions/prompt_powerlevel9k_setup
    #zgen load ~/powerlevel9k
    #ln -s -f ~/powerlevel9k/powerlevel9k.zsh-theme ~/.zprezto/modules/prompt/functions/prompt_powerlevel9k_setup
    if [ ! -f ~/.fonts/fontawesome-regular.ttf ]; then
        mkdir -p ~/.fonts/
        wget -P ~/.fonts/ https://github.com/gabrielelana/awesome-terminal-fonts/raw/master/build/pomicons-regular.ttf\
                          https://github.com/gabrielelana/awesome-terminal-fonts/raw/master/build/fontawesome-regular.ttf\
                          https://github.com/gabrielelana/awesome-terminal-fonts/raw/master/build/octicons-regular.ttf
        fc-cache -fv ~/.fonts
    fi

    #zgen prezto prompt theme 'skwp'
    zgen prezto prompt theme 'powerlevel9k'
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



# === history-substring-search ===
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward


bindkey '^j' history-substring-search-up
bindkey '^k' history-substring-search-down

bindkey -a 'k' history-beginning-search-backward
bindkey -a 'j' history-beginning-search-forward
bindkey '^?' backward-delete-char

# === end history-substring-search===

# === autosuggestion ===
bindkey '^v' vi-forward-blank-word

bindkey "^I" expand-or-complete

zle-line-init() {
    zle autosuggest-start
}
zle -N zle-line-init
AUTOSUGGESTION_HIGHLIGHT_COLOR='fg=6'
AUTOSUGGESTION_HIGHLIGHT_CURSOR=0

# === end autosuggestion ===

# We want to use HEAD^ in git
unsetopt extendedglob

if [ -f ~/.zprofile ]; then
    source ~/.zprofile
fi

if [ -f ~/.zaliases ]; then
    source ~/.zaliases
fi
