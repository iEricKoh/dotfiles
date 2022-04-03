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

zinit snippet OMZ::plugins/git/git.plugin.zsh


zinit ice from"gh-r" as"program"
zinit load junegunn/fzf-bin

zinit light zsh-users/zsh-history-substring-search

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

alias vim="nvim"
alias vi="nvim"
alias oldvim="vim"
#alias npm="pnpm"

export PATH="$PATH:/Users/eric/development/flutter/bin"

export DB_USER=postgres
export DB_NAME=baopals_backend_development
export DB_PASS=postgres
#export RDS_PASSWORD=redis
export RDS_PASSWORD=

#export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
#export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

. /opt/homebrew/opt/asdf/asdf.sh

#export GEM_HOME=$HOME/.gem
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$PATH":"$HOME/development/flutter/.pub-cache/bin"
export PATH="$PATH":"$HOME/.local/bin"

export GOPATH="${HOME}/go"
#export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
#export PATH="$PATH:${HOME}/Library/Android/sdk/platform-tools"
#export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/library"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

export PATH="/Users/eric/.deno/bin:$PATH"
export PATH="${HOME}/Library/Android/sdk/platform-tools:$PATH"

#export PYTHON=$HOME/.pyenv/versions/2.7.18/bin/python
#export NODE_GYP_FORCE_PYTHON=$HOME/.pyenv/versions/2.7.18/bin/python

#export NVM_DIR="$HOME/.nvm"
#[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
#[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

export HISTFILESIZE=1000000
export HISTSIZE=1000000
export TERM=xterm-256color
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
#export CHROME_EXECUTABLE="/Applications/Google Chrome Canary.app/Contents/MacOS/Google Chrome Canary"

eval "$(rbenv init -)"

eval "$(starship init zsh)"
