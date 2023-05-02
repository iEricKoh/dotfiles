export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# The following lines were added by compinstall
zstyle :compinstall filename '/Users/eric/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

zinit ice lucid wait='0'
zinit light skywind3000/z.lua

zinit ice lucid wait='0' atinit='zpcompinit'
zinit light zdharma/fast-syntax-highlighting

zinit ice lucid wait="0" atload='_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

zi ice wait lucid atload'_zsh_autosuggest_start'
zi light zsh-users/zsh-autosuggestions

# zinit for \
#                 zdharma/history-search-multi-word \
#     light-mode pick"async.zsh" src"pure.zsh" \
#                 sindresorhus/pure

zinit ice lucid wait='1'
zinit snippet OMZ::plugins/git/git.plugin.zsh

zinit ice from"gh-r" as"program"
zinit load junegunn/fzf-bin

# zinit ice lucid wait='0'
zinit light zsh-users/zsh-history-substring-search

zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure

zi light DarrinTisdale/zsh-aliases-exa

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

alias vim="nvim"
alias vi="nvim"
alias oldvim="vim"
alias npm="pnpm"
alias npx="pnpx"

export PATH="$PATH:/Users/eric/development/flutter/bin"

export DB_USER=postgres
export DB_NAME=baopals_backend_development
export DB_PASS=postgres
#export RDS_PASSWORD=redis
export RDS_PASSWORD=redis

#export GEM_HOME=$HOME/.gem
#export PATH=$GEM_HOME/bin:$PATH

# export PATH="$PATH":"$HOME/development/flutter/.pub-cache/bin"
export PATH="$PATH":"$HOME/.local/bin"

#export GOPATH="${HOME}/go"
#export GOROOT="$(brew --prefix golang)/libexec"
#export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
#export PATH="$PATH:${HOME}/Library/Android/sdk/platform-tools"
#export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/library"
#export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

#export PATH="/Users/eric/.deno/bin:$PATH"
#export PATH="${HOME}/Library/Android/sdk/platform-tools:$PATH"

#export PYTHON=$HOME/.pyenv/versions/2.7.18/bin/python
#export NODE_GYP_FORCE_PYTHON=$HOME/.pyenv/versions/2.7.18/bin/python

export HISTFILESIZE=1000000
export HISTSIZE=1000000
#export TERM=xterm-256color
#export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
#export CHROME_EXECUTABLE="/Applications/Google Chrome Canary.app/Contents/MacOS/Google Chrome Canary"

# eval "$(rbenv init -)"

eval "$(starship init zsh)"

# pnpm
export PNPM_HOME="/Users/eric/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end


# export FZF_DEFAULT_COMMAND='fd --type f'
#export NODE_OPTIONS=--openssl-legacy-provider

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
export LDFLAGS="-L/opt/homebrew/opt/readline/lib:$LDFLAGS"
export CPPFLAGS="-I/opt/homebrew/opt/readline/include:$CPPFLAGS"
export PKG_CONFIG_PATH="/opt/homebrew/opt/readline/lib/pkgconfig:$PKG_CONFIG_PATH"
export optflags="-Wno-error=implicit-function-declaration"
export LDFLAGS="-L/opt/homebrew/opt/libffi/lib:$LDFLAGS"
export CPPFLAGS="-I/opt/homebrew/opt/libffi/include:$CPPFLAGS"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libffi/lib/pkgconfig:$PKG_CONFIG_PATH"


export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export HOMEBREW_INSTALL_FROM_API=1
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH="$PATH":"$HOME/.pub-cache/bin"
export GOOGLE_APPLICATION_CREDENTIALS="$HOME/Downloads/spherical-entry-279802-firebase-adminsdk-9xxgd-98ceddd0fc.json"

. /opt/homebrew/opt/asdf/libexec/asdf.sh
