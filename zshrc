export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"

# The following lines were added by compinstall
zstyle :compinstall filename '/Users/eric/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

zinit for \
    light-mode  zsh-users/zsh-autosuggestions \
    light-mode  zdharma/fast-syntax-highlighting \
                zdharma/history-search-multi-word \
    light-mode pick"async.zsh" src"pure.zsh" \
                sindresorhus/pure

zinit ice from"gh-r" as"program"
zinit load junegunn/fzf-bin

zinit light zsh-users/zsh-history-substring-search

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

alias vim="nvim"
alias vi="nvim"
alias oldvim="vim"

export PATH="$PATH:/Users/eric/development/flutter/bin"

#To use the bundled libc++ please add the following LDFLAGS:
#  LDFLAGS="-L/opt/homebrew/opt/llvm/lib -Wl,-rpath,/opt/homebrew/opt/llvm/lib"
#
#llvm is keg-only, which means it was not symlinked into /opt/homebrew,
#because macOS already provides this software and installing another version in
#parallel can cause all kinds of trouble.
#
#If you need to have llvm first in your PATH run:
#  echo 'export PATH="/opt/homebrew/opt/llvm/bin:$PATH"' >> ~/.zshrc
#
#For compilers to find llvm you may need to set:
#  export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
#  export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
# For compilers to find zlib you may need to set:
#   export LDFLAGS="-L/opt/homebrew/opt/zlib/lib"
#   export CPPFLAGS="-I/opt/homebrew/opt/zlib/include"
# 
# For pkg-config to find zlib you may need to set:
#   export PKG_CONFIG_PATH="/opt/homebrew/opt/zlib/lib/pkgconfig"
#export LDFLAGS="-L/opt/homebrew/opt/libffi/lib"
#export CPPFLAGS="-I/opt/homebrew/opt/libffi/include"
#export PKG_CONFIG_PATH="/opt/homebrew/opt/libffi/lib/pkgconfig"

#export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
#export LDFLAGS="-L/opt/homebrew/opt/libpq/lib"
#export CPPFLAGS="-I/opt/homebrew/opt/libpq/include"
#export PKG_CONFIG_PATH="/opt/homebrew/opt/libpq/lib/pkgconfig"

export DB_USER=postgres
export DB_NAME=baopals_backend_development
export DB_PASS=postgres
export RDS_PASSWORD=redis

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

. /opt/homebrew/opt/asdf/asdf.sh

#. /opt/homebrew/opt/asdf/etc/bash_completion.d/asdf.bash
#export GEM_HOME=$HOME/.gem
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

export PATH="$PATH":"$HOME/development/flutter/.pub-cache/bin"

export GOPATH="${HOME}/go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
