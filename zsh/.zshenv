skip_global_compinit=1
export VIRTUAL_ENV_DISABLE_PROMPT=false
export PATH=$PATH:$HOME/.scripts
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=/opt/ghc/7.10.2/bin:$PATH
export PATH=$PATH:$HOME/.cabal/bin:/opt/cabal/1.20/bin:/opt/ghc/7.8.3/bin:/opt/happy/1.19.4/bin:/opt/alex/3.1.3/bin
#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH=${PATH}:$HOME/Android/Sdk/platform-tools:$HOME/Android/Sdk/build-tools
export ANDROID_HOME=$HOME/Android/Sdk/
export PATH=$HOME/.local/bin:$PATH
export PAGER=less
export LANG=is_IS.utf8
export PATH="/usr/local/heroku/bin:$PATH"
GPG_TTY=$(tty)
export GPG_TTY
if [ -f "${HOME}/.gpg-agent-info" ]; then
        . "${HOME}/.gpg-agent-info"
        export GPG_AGENT_INFO
        export SSH_AUTH_SOCK
fi
export EDITOR=vim
