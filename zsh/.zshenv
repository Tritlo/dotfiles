skip_global_compinit=1
export VIRTUAL_ENV_DISABLE_PROMPT=false
export PATH=$PATH:$HOME/.scripts
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/Library/Haskell/bin
#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH=${PATH}:$HOME/Android/Sdk/platform-tools:$HOME/Android/Sdk/build-tools
export ANDROID_HOME=$HOME/Android/Sdk/
export PAGER=less
export LANG=is_IS.UTF-8
export LC_ALL=is_IS.UTF-8
export PATH="/usr/local/heroku/bin:$PATH"
GPG_TTY=$(tty)
export GPG_TTY
if [ -f "${HOME}/.gpg-agent-info" ]; then
        . "${HOME}/.gpg-agent-info"
        export GPG_AGENT_INFO
        export SSH_AUTH_SOCK
fi


export EDITOR=vim

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
