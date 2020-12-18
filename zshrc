
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

path=('/opt/homebrew/bin' $path)
export PATH
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
