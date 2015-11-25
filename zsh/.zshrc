# ===  BEGIN POWERLEVEL9K ===
#
#

zsh_signal(){
    local signal=$(timeout 1s nmcli device wifi | grep yes | awk '{print $8}')
    local color='%F{yellow}'
    [[ $signal -gt 75 ]] && color='%F{green}'
    [[ $signal -lt 50 ]] && color='%F{red}'
    #echo -n "%{$color%}\uf230  $signal%{%f%}" # \uf230 is 
    echo -n "%{$color%}\uf230%{%f%}" # \uf230 is 
}


if [ "$TERM" = "screen" ] || [ "$TERM" = "xterm" ]; then
    export TERM=$TERM-256color
fi
POWERLEVEL9K_MODE='awesome-fontconfig'
#POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='▶'
#POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='◀'
#POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR='>'
#POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR='<'
#POWERLEVEL9K_BATTERY_FOREGROUND="white"
POWERLEVEL9K_BATTERY_ICON=' ' # \uf2ca
POWERLEVEL9K_BATTERY_BACKGROUND='black'
POWERLEVEL9K_BATTERY_DISCONNECTED='cyan'
POWERLEVEL9K_OK_ICON='✓'
POWERLEVEL9K_FAIL_ICON='✘'
POWERLEVEL9K_VCS_STASH_ICON=" " # \uf2c5
POWERLEVEL9K_HOME_ICON=" " # \uf28d
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=" " #\uf0ed               #  
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=" " #\uf0ee               # 
POWERLEVEL9K_VCS_UNSTAGED_ICON=" " # \uf228
POWERLEVEL9K_BACKGROUND_JOBS_ICON=" " # \uf22f
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""

local user_symbol="$"
if [[ $(print -P "%#") =~ "#" ]]; then
    user_symbol = "#"
fi

#POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="%{%B%F{yellow}%K{blue}%} $user_symbol%{%b%f%k%F{blue}%}▶ %{%f%}"
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="%{%B%F{yellow}%K{blue}%} $user_symbol%{%f%b%k%F{blue}%} %{%f%}"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context time battery custom_signal dir vcs virtualenv)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(aws status load ram custom_docker)
POWERLEVEL9K_CUSTOM_DOCKER='echo "\uf299 $(timeout 1s docker ps -a | grep Up | wc -l)"' # \uf299 is 
POWERLEVEL9K_CUSTOM_DOCKER_FOREGROUND="white"
POWERLEVEL9K_CUSTOM_DOCKER_BACKGROUND="blue"
POWERLEVEL9K_CUSTOM_SIGNAL='zsh_signal'
POWERLEVEL9K_CUSTOM_SIGNAL_FOREGROUND="white"
POWERLEVEL9K_CUSTOM_SIGNAL_BACKGROUND="black"
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
    echo "Zgen not found, bootstrapping."
    mkdir -p ~/.zgen
    curl -L https://raw.githubusercontent.com/tarjoilija/zgen/master/zgen.zsh > ~/.zgen/zgen.zsh
fi

source ~/.zgen/zgen.zsh
if ! zgen saved; then
    
    # Bootstrap fonts
    if [ ! -f ~/.fonts/fontawesome-regular.ttf ]; then
        mkdir -p ~/.fonts/
        wget -P ~/.fonts/ https://github.com/gabrielelana/awesome-terminal-fonts/raw/master/build/pomicons-regular.ttf\
                          https://github.com/gabrielelana/awesome-terminal-fonts/raw/master/build/fontawesome-regular.ttf\
                          https://github.com/gabrielelana/awesome-terminal-fonts/raw/master/build/octicons-regular.ttf
        fc-cache -fv ~/.fonts
    fi
    

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
    if [[ ! $TERM =~ linux ]]; then 
        zgen load bhilburn/powerlevel9k powerlevel9k.zsh-theme next
    fi

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

# zsh reads .zshenv automatically
# if [ -f ~/.zshenv ]; then
#     source ~/.zshenv
# fi

if [ -f ~/.zaliases ]; then
    source ~/.zaliases
fi
# Set theme to skwp, this only matters if powerlevel9k.zsh-theme is not loaded.
prompt skwp
