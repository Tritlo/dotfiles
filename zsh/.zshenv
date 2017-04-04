skip_global_compinit=1
if [ -e /Users/tritlo/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/tritlo/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
export PATH=$PATH:/usr/local/bin:/usr/local/MacGPG2/bin
export VIRTUAL_ENV_DISABLE_PROMPT=false
export PATH=$PATH:$HOME/.scripts
export PATH=$PATH:$HOME/Library/Haskell/bin
#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PAGER=less
export LANG=is_IS.UTF-8
export LC_ALL=is_IS.UTF-8


export EDITOR='emacsclient -a="vim"'

# Add GHC 7.10.2 to the PATH, via https://ghcformacosx.github.io/
export GHC_DOT_APP="/opt/homebrew-cask/Caskroom/ghc/7.10.2-r0/ghc-7.10.2.app"
if [ -d "$GHC_DOT_APP" ]; then
export PATH="${HOME}/.local/bin:${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi
export WORKON_HOME="$HOME/Code/PyVenvs"
export AWS_DEFAULT_PROFILE=fronken
export LIBRARY_PATH=/opt/X11/lib:$LIBRARY_PATH
export DYLD_FALLBACK_LIBRARY_PATH=/opt/X11/lib:$DYLD_FALLBACK_LIBRARY_PATH
export MPLBACKEND="module://matplotlib.backends.backend_tkagg"
eval "$(/usr/local/bin/pyenv init -)"
export PATH=$PATH:/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin
export PATH=$HOME/.local/bin:$PATH
export SHELL=/bin/bash



GPG_TTY=$(tty)
export GPG_TTY
eval $(gpg-agent --quiet --daemon 2> /dev/null)
if [ -f "${HOME}/.gpg-agent-info" ]; then
        . "${HOME}/.gpg-agent-info"
        export GPG_AGENT_INFO
        export SSH_AUTH_SOCK
fi


export PATH="/usr/local/sbin:$PATH"

export PATH="$HOME/.yarn/bin:$PATH"

export PATH="$HOME/Code/arcanist/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

#export DOCKER_TLS_VERIFY="1"
#export DOCKER_HOST="tcp://192.168.99.100:2376"
#export DOCKER_CERT_PATH="/Users/tritlo/.docker/machine/machines/default"
#export DOCKER_MACHINE_NAME="default"

