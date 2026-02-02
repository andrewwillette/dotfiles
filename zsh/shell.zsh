XDG_CONFIG_HOME=$HOME/.config
HISTSIZE=10000000000
SAVEHIST=10000000000
HISTFILE=~/.zsh_history

# Source private shell config if it exists
PRIVATE_SHELLCONFIG="$HOME/git/dotfiles_private/shellconfig.sh"
[[ -f "$PRIVATE_SHELLCONFIG" ]] && source "$PRIVATE_SHELLCONFIG"

setopt EXTENDED_HISTORY
setopt EXTENDED_GLOB
setopt SHARE_HISTORY

# node and npm management with node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion}

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
[ -d "$HOME/.rvm/bin" ] && export PATH="$PATH:$HOME/.rvm/bin"
[ -d "$HOME/.local/bin" ] && export PATH="$PATH:$HOME/.local/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

[[ -s "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"
[ -d $HOME/.cargo/bin ] && export PATH="$PATH:$HOME/.cargo/bin"
[ -d $HOME/.dotnet/tools ] && export PATH="$PATH:$HOME/.dotnet/tools"

if test -d "$HOME/bin"; then
    PATH+=":$HOME/bin"
fi

# add directories of scripts dir
SCRIPTS_DIR="$HOME/git/scripts"
if test -d "$SCRIPTS_DIR";
then
    PATH+=:"$SCRIPTS_DIR"
    for dir in $SCRIPTS_DIR/*/ ; do
        TRIMMED=$(echo $dir | sed 's:/*$::')
        PATH+=":$TRIMMED"
    done
fi

# add directories of scripts_public dir
SCRIPTS_PUBLIC_DIR="$HOME/git/scripts_public"
if test -d "$SCRIPTS_PUBLIC_DIR";
then
    PATH+=:"$SCRIPTS_PUBLIC_DIR"
    for dir in $SCRIPTS_PUBLIC_DIR/*/ ; do
        TRIMMED=$(echo $dir | sed 's:/*$::')
        PATH+=":$TRIMMED"
    done
fi

EDITOR=$(which nvim)
alias e="$EDITOR"

# download youtube url as audio to ~/tmp
yt(){
    var_path=$PWD
    cd ~/tmp
    yt-dlp --extract-audio --audio-format wav $1
    cd $var_path
}

alias sz='source ~/.zshrc'

# Golang config
export GOPATH=$HOME/gocode
[ -d "$GOPATH/bin" ] && export GOBIN=$GOPATH/bin
[ -d "$GOPATH/cache" ] && export GOCACHE=$HOME/gocode/cache
[ -n "$GOBIN" ] && mkdir -p $GOBIN
[ -d "$HOME/gocode/bin" ] && export PATH="$PATH:$GOPATH/bin"

# configure for the PURE prompt in zshrc
if test -d "/opt/homebrew/share/zsh/site-functions"; then
    fpath+=("/opt/homebrew/share/zsh/site-functions")
fi
autoload -U promptinit; promptinit
# Check whether 'pure' prompt is available and only then set it.
if prompt -l | grep -q 'pure'; then
    prompt pure
    zstyle ':prompt:pure:prompt:*' color '#b8bb26'
    zstyle ':prompt:pure:git:arrow' color '#b8bb26'
    zstyle ':prompt:pure:path' color '#d3869b'
    zstyle ':prompt:pure:git:dirty' color '#d3869b'
    zstyle ':prompt:pure:git:branch' color '#fabd2f'
fi

# autocompletion
# case insensitive autocompletion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
[ -d ~/.zsh/completion ] && fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit

[ -f ~/git/lua-language-server/bin/lua-language-server ] && export PATH="$PATH:~/git/lua-language-server/bin"
[ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias g='. cdg.sh'

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
# Set up fzf key bindings and fuzzy completion
command -v fzf >/dev/null && source <(fzf --zsh)

# neovim development
# alias luamake=~/.config/nvim/lua-language-server/3rd/luamake/luamake
export ASAN_OPTIONS="detect_leaks=1:check_initialization_order=1:log_path=/Users/andrewwillette/tmp/asan"

[ -d "$HOME/.yarn/bin" ] && export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

[ -f /usr/local/cof/bin/cofproxy ] && source /usr/local/cof/bin/cofproxy &>/dev/null


[ -f ~/git/dotfiles/.gitignore_global ] && git config --global core.excludesfile ~/git/dotfiles/.gitignore_global
alias lzd='lazydocker'

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

# export JAVA_HOME=`/usr/libexec/java_home -v 1.11`

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

autoload -U +X bashcompinit && bashcompinit
[ -x /usr/local/bin/terraform ] && complete -o nospace -C /usr/local/bin/terraform terraform

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
# export CC="clang"
# export CXX="clang++"
# brew installed llvm
# export PATH="/usr/local/opt/llvm/bin:$PATH"
# export LDFLAGS="-L/usr/local/opt/llvm/lib -L/Library/Developer/CommandLineTools/usr/bin"
# export CPPFLAGS="-I/usr/local/opt/llvm/include -I/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/c++/v1"
# export CFLAGS="-D_XOPEN_SOURCE=600 -D_DARWIN_C_SOURCE"
# export CXXFLAGS="-D_XOPEN_SOURCE=600 -D_DARWIN_C_SOURCE -std=c++17 -stdlib=libc++"
# hacky, seems default SDK root shown with command 'clang++ -E -x c++ - -v < /dev/null' was pointing to non-existent directory, setting explicitly for now
# ran into when trying to build lua-language-server
export SDKROOT=$(xcrun --sdk macosx --show-sdk-path)
export CPLUS_INCLUDE_PATH="$SDKROOT/usr/include/c++/v1:$CPLUS_INCLUDE_PATH"
export C_INCLUDE_PATH="$SDKROOT/usr/include:$C_INCLUDE_PATH"

# suppresses some rust_analyzer error messages in neovim
# export RA_LOG=rust_analyzer=error

# causes pipenv to install .venv in directory
export PIPENV_VENV_IN_PROJECT=1

export SERVER_LOG_PRIVATE_KEY="/Users/andrewwillette/git/dotfiles/.ssh/id_rsa"
export SERVER_LOG_IP="3.141.6.188"
export SERVER_LOG_USER="ubuntu"
export SERVER_LOG_LOG_LOCATION="/home/ubuntu/server.log"

# GoLang
[ -n "$GOROOT" ] && [ -d "$GOROOT/bin" ] && export PATH=$GOROOT/bin:$PATH
export GOPATH=$HOME/gocode
[ -d "$GOPATH/bin" ] && export PATH=$GOPATH/bin:$PATH
export GOPROXY="direct"

export PLUTUS_AMEX_DIR="$HOME/Documents/plutus/amex"
export PLUTUS_CAPONE_DIR="$HOME/Documents/plutus/capone"
