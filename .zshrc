# ZSH Configurations

# ZSH Dotfile Order: [.zshenv] -> [.zprofile] -> [.zshrc] -> [.zlogin] -> [.zlogout]
# [.zshenv]: Always sourced. Set environment variables that need to be updated frequently.
# [.zprofile]: Like .zshenv but for commands and variables that don't need to be frequently updated.
# [.zshrc]: Anthing needed for interactive usage (prompt, command-related, output coloring, aliases, key bindings`:w).
# https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout

# NVM (Node.js)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# GOPATH (Go)
export GOPATH=$(go env GOPATH)
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

# Rust (found in .zshenv)

# Most Popular ZSH Extensions: https://safjan.com/top-popular-zsh-plugins-on-github/

# ZSH Auto-Suggestions
# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# ZSH Syntax Highlighting
# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Aliases (Mac) (using GNU Coreutils)
alias ls="gls --color"
alias la="gls -A --color"
# alias ls="ls -G"
# alias la="ls -AG"

# Starship
eval "$(starship init zsh)"

# Direnv
export DIRENV_LOG_FORMAT= # silent
eval "$(direnv hook zsh)"

# SDKMAN (JVM languages + tools)
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
