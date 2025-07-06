XDG_CONFIG_HOME=$HOME/.config
HISTSIZE=10000000000
SAVEHIST=10000000000
HISTFILE=~/.zsh_history

setopt EXTENDED_HISTORY
setopt EXTENDED_GLOB
setopt SHARE_HISTORY

# node and npm management with node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion}

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/.local/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

[[ -s "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"
[ -d $HOME/.cargo/bin ] && export PATH="$PATH:$HOME/.cargo/bin"
[ -d $HOME/.dotnet/tools ] && export PATH="$PATH:$HOME/.dotnet/tools"

export PATH="/usr/local/opt/terraform@0.12/bin:$PATH"

function jenv_init {
    export PATH="$HOME/.jenv/bin:$PATH"
    eval "$(jenv init -)"

    alias je='jenv exec'
}

if test -d "$HOME/bin"; then
    PATH+=":$HOME/bin"
fi

if test -d "$HOME/git/lynx/bin";
then
    PATH+=":$HOME/git/lynx/bin"
fi

# add directories of scripts dir
if test -d "$HOME/git/willette_terminal/scripts";
then
    PATH+=:"$HOME/git/willette_terminal/scripts"
    for dir in $HOME/git/willette_terminal/scripts/*/ ; do
        TRIMMED=$(echo $dir | sed 's:/*$::')
        PATH+=":$TRIMMED"
    done
fi

if test -d "$HOME/maven/apache-maven-3.6.3/bin"; then
    export PATH="$HOME/maven/apache-maven-3.6.3/bin:$PATH"
fi

if [[ $USER == "rjm995" ]] then
  if hash nvim 2>/dev/null; then
    EDITOR=$(which nvim)
    # export VIMRUNTIME=$HOME/git/neovim/runtime
  else
    "nvim not available to set editor to"
  fi
else
  if hash nvim 2>/dev/null; then
    EDITOR=$(which nvim)
    # export VIMRUNTIME=$HOME/git/neovim/runtime
  else
    "nvim not available to set editor to"
  fi
fi

alias e="$EDITOR"

export PGUSER="andrew"
export PGPASSWORD="andrew"

# download youtube url as audio to ~/tmp
yt(){
    var_path=$PWD
    cd ~/tmp
    yt-dlp --extract-audio --audio-format wav $1
    cd $var_path
}

alias vf='nvim `fzf`'
alias lynx='lynx -vikeys'
alias sz='source ~/.zshrc'

run_converter() {
    java -jar target/system-account-converter-1.0-SNAPSHOT-shaded.jar $1 $2 $3 $4
}

# Golang config
export GOPATH=$HOME/gocode
export GOBIN=$HOME/gocode/bin
export GOCACHE=$HOME/gocode/cache
mkdir -p $GOBIN
export PATH="$PATH:$GOPATH/bin"

# configure for the PURE prompt in zshrc
autoload -U promptinit; promptinit
prompt pure
# zstyle ':prompt:pure:prompt:*' color cyan
zstyle ':prompt:pure:prompt:*' color '#b8bb26'
zstyle ':prompt:pure:git:arrow' color '#b8bb26'
zstyle ':prompt:pure:path' color '#d3869b'
zstyle ':prompt:pure:git:dirty' color '#d3869b'
zstyle ':prompt:pure:git:branch' color '#fabd2f'

# autocompletion
# case insensitive autocompletion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
[ -d ~/.zsh/completion ] && fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit

# [[ -s '/usr/local/bin/aws_completer' ]] && complete -C '/usr/local/bin/aws_completer' aws

# set -ga terminal-overrides ",xterm-256color:Tc"
# export TERM=screen-256color
# if [ "$TERM" = "xterm" ]; then
#   export TERM=xterm-256color
# fi
alias tmux='tmux -2'  # for 256color

export LYNX_CFG=~/.lynxrc

#function kitchen_login_chef16() {
    #x=$(kitchen list|awk '/chef16/ {print $1}'); kitchen login $x
#}

#function kitchen_test_chef16() {
    #x=$(kitchen list|awk '/chef16/ {print $1}'); kitchen test $x
#}


[ -f ~/git/lua-language-server/bin/lua-language-server ] && export PATH="$PATH:~/git/lua-language-server/bin"
# https://github.com/zsh-users/zsh-syntax-highlighting added via homebrew
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias g='. cdg'

# brew --prefix outputs /usr/local for future reference
#if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi

bindkey -v
export VISUAL=nvim
autoload editor; zle -N editor
autoload edit-command-line; zle -N edit-command-line

bindkey -M vicmd "v" edit-command-line

# FZF configuration
export FZF_DEFAULT_COMMAND='fd --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND='fd --hidden --follow --exclude .git'
# gruvbox
export FZF_DEFAULT_OPTS='--color=bg+:#3c3836,bg:#32302f,spinner:#fb4934,hl:#928374,fg:#ebdbb2,header:#928374,info:#8ec07c,pointer:#fb4934,marker:#fb4934,fg+:#ebdbb2,prompt:#fb4934,hl+:#fb4934'
# junegunn/seoul256.vim (dark)
# export FZF_DEFAULT_OPTS='--color=bg+:#3F3F3F,bg:#4B4B4B,border:#6B6B6B,spinner:#98BC99,hl:#719872,fg:#D9D9D9,header:#719872,info:#BDBB72,pointer:#E12672,marker:#E17899,fg+:#D9D9D9,preview-bg:#3F3F3F,prompt:#98BEDE,hl+:#98BC99'
# nordvim
# export FZF_DEFAULT_OPTS='--color=bg+:#3B4252,bg:#2E3440,spinner:#81A1C1,hl:#616E88,fg:#D8DEE9,header:#616E88,info:#81A1C1,pointer:#81A1C1,marker:#81A1C1,fg+:#D8DEE9,prompt:#81A1C1,hl+:#81A1C1'
# catpuccin latte
# export FZF_DEFAULT_OPTS=" \
# --color=bg+:#ccd0da,bg:#eff1f5,spinner:#dc8a78,hl:#d20f39 \
# --color=fg:#4c4f69,header:#d20f39,info:#8839ef,pointer:#dc8a78 \
# --color=marker:#dc8a78,fg+:#4c4f69,prompt:#8839ef,hl+:#d20f39"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}
# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# neovim development
# alias luamake=~/.config/nvim/lua-language-server/3rd/luamake/luamake
export ASAN_OPTIONS="detect_leaks=1:check_initialization_order=1:log_path=/Users/andrewwillette/tmp/asan"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

[ -f /usr/local/cof/bin/cofproxy ] && source /usr/local/cof/bin/cofproxy &>/dev/null


[ -f ~/git/willette_terminal/.gitignore_global ] && git config --global core.excludesfile ~/git/willette_terminal/.gitignore_global
alias lzd='lazydocker'

export COURSIER_MIRRORS="~/Library/Preferences/Coursier/mirror.properties"
export COURSIER_REPOSITORIES="ivy2Local|central|sonatype:releases|jitpack|https://artifactory.cloud.capitalone.com/artifactory/sbt-internalfacing/|https://artifactory.cloud.capitalone.com/artifactory/sbt-internalfacing/|https://artifactory.cloud.capitalone.com/artifactory/maven-internalfacing/"

[ -d "$HOME/Library/Application Support/Coursier/bin" ] && export PATH="$PATH:$HOME/Library/Application Support/Coursier/bin"

jvm_opts_proxy_on() {
    # extract the protocol
    proto="$(echo ${https_proxy} | grep :// | sed -e's,^\(.*://\).*,\1,g')"
    # remove the protocol
    url="$(echo ${${https_proxy}/$proto/})"
    # extract the user (if any)
    user="$(echo $url | grep @ | cut -d@ -f1)"
    # extract the host and port
    hostport="$(echo ${url/$user@/} | cut -d/ -f1)"
    # by request host without port    
    host="$(echo $hostport | sed -e 's,:.*,,g')"
    # by request - try to extract the port
    port="$(echo $hostport | sed -e 's,^.*:,:,g' -e 's,.*:\([0-9]*\).*,\1,g' -e 's,[^0-9],,g')"
    no_proxy_java="$(echo ${no_proxy} | sed 's/,\./|*./g' | sed 's/,/|/g')"
    no_proxy_java="${no_proxy_java}|*.maven.org"
    export JAVA_OPTS="""
    -Xmx4g
    -Dhttp.proxySet=true
    -Dhttp.proxyHost=${proto}${host}
    -Dhttp.proxyPort=${port}
    -Dhttp.nonProxyHosts=${no_proxy_java}
    -Dhttps.proxySet=true
    -Dhttps.proxyHost=${proto}${host}
    -Dhttps.proxyPort=${port}
    -Dhttps.nonProxyHosts=${no_proxy_java}"""
    echo "=================="
    echo "JAVA_OPTS"
    echo "------------------"
    echo ${JAVA_OPTS}
    echo "=================="
}
jvm_opts_proxy_off() {
    export JAVA_OPTS="-Xmx4g"
}
export JAVA_HOME=`/usr/libexec/java_home -v 1.11`

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

[[ -s "$HOME/.c1shell" ]] && source "$HOME/.c1shell"

[[ -d "/opt/metasploit-framework/bin" ]] && export PATH="$PATH:/opt/metasploit-framework/bin"
[[ -d "$HOME/.gem/ruby/3.0.0/bin" ]] && export PATH="$PATH:$HOME/.gem/ruby/3.0.0/bin"
[[ -d "$HOME/.gem/ruby/3.1.0/bin" ]] && export PATH="$PATH:$HOME/.gem/ruby/3.1.0/bin"
[[ -d "$HOME/.rbenv/bin" ]] && export PATH="$PATH:$HOME/.rbenv/bin"
path_to_rbenv=$(which rbenv)
if [ -x "$path_to_rbenv" ] ; then
  eval "$(rbenv init - zsh)"
fi

# flutter and dart installed on personal macos
[ -d "$HOME/Downloads/flutter/bin" ] && export PATH="$PATH:$HOME/Downloads/flutter/bin"

# export CC="gcc-11"
export CC="clang"
export CXX="clang++"
# brew installed llvm
export PATH="/usr/local/opt/llvm/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/llvm/lib -L/Library/Developer/CommandLineTools/usr/bin"
export CPPFLAGS="-I/usr/local/opt/llvm/include -I/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/c++/v1"
export CFLAGS="-D_XOPEN_SOURCE=600 -D_DARWIN_C_SOURCE"
export CXXFLAGS="-D_XOPEN_SOURCE=600 -D_DARWIN_C_SOURCE -std=c++17 -stdlib=libc++"
# hacky, seems default SDK root shown with command 'clang++ -E -x c++ - -v < /dev/null' was pointing to non-existent directory, setting explicitly for now
# ran into when trying to build lua-language-server
export SDKROOT='/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk'

# suppresses some rust_analyzer error messages in neovim
# export RA_LOG=rust_analyzer=error

# causes pipenv to install .venv in directory
export PIPENV_VENV_IN_PROJECT=1

export SERVER_LOG_PRIVATE_KEY="/Users/andrewwillette/git/willette_terminal/.ssh/id_rsa"
export SERVER_LOG_IP="3.141.6.188"
export SERVER_LOG_USER="ubuntu"
export SERVER_LOG_LOG_LOCATION="/home/ubuntu/server.log"

# GoLang
export PATH=$GOROOT/bin:$PATH
export GOPATH=$HOME/gocode
export PATH=$GOPATH/bin:$PATH
export GOPROXY="direct"
# disable go sum module verification
# export GOSUMDB=off
# export GOARCH=arm64


export PLUTUS_AMEX_DIR="$HOME/Documents/plutus/amex"
export PLUTUS_CAPONE_DIR="$HOME/Documents/plutus/capone"

export ANDREWWILLETTE_PUBLIC_IP="3.141.6.188"

export PATH=$HOME/.local/bin:$PATH
