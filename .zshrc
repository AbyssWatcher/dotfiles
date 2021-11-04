# ZSH Configurations

# ZSH Dotfile Order: [.zshenv] -> [.zprofile] -> [.zshrc] -> [.zlogin] -> [.zlogout]
# [.zshenv]: Always sourced. Set environment variables that need to be updated frequently.
# [.zprofile]: Like .zshenv but for commands and variables that don't need to be frequently updated.
# [.zshrc]: Anthing needed for interactive usage (prompt, command-related, output coloring, aliases, key bindings`:w).
# https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout

# ZSH Notes
# - ZSH does not read readline's .inputrc (unlike BASH).
# - ZSH has its own line editor (ZLE).

# ZSH vs. BASH Scripting: https://unix.stackexchange.com/questions/38172/are-all-bash-scripts-compatible-with-zsh
# Use #!/usr/bin/env bash for shell scripts so that you don't run into incompatability issues.

# ZSH Options: https://zsh.sourceforge.io/Doc/Release/Options.html
# ZSH Features: https://code.joejag.com/2014/why-zsh.html

# ZSH History: https://kevinjalbert.com/more-shell-history/
HISTSIZE=10000 # Number of commands (from history) loaded into shell's memory.
SAVEHIST=10000 # Number of commands your history can hold (>= HISTSIZE)
HISTFILE=~/.zsh_history # Save history to .zsh_history.
setopt HIST_FIND_NO_DUPS # No duplicates taken from history.
# setopt HIST_IGNORE_ALL_DUPS # Prevent duplicates from being saved to history.
setopt INC_APPEND_HISTORY_TIME # Append to history + Not available immediately to other shells.
setopt HIST_IGNORE_SPACE # Remove commands from history where first char is a space.

# _comp_options+=(globdots) # Apparently better option.
setopt globdots # Show hidden files.

# https://unix.stackexchange.com/questions/12288/zsh-insert-completion-on-first-tab-even-if-ambiguous
setopt MENU_COMPLETE # Automatically highlight first element of completion menu.
setopt AUTO_LIST # Automatically list choices on ambiguous completion.
setopt COMPLETE_IN_WORD # Complete from both ends of a word.

# TODO: Look through ZSH Plugins (https://github.com/ohmyzsh/ohmyzsh/wiki/plugins#vscode)
# TODO: LS (Dotfiles first + Case-Insensitive). EXA (Already default functionality).
# TODO: ZSH Menu (Dotfiles first + Case-Insensitive). Maintain parity with LS/EXA.

# TODO: Start using Folder Shorthand
# TODO: Read about ZSH Completion (https://thevaluable.dev/zsh-completion-guide-examples/)
# TODO: Command Parking with CTRL + q
# TODO: Go through options for - AND -- flags

# ZSH Substring Search:  https://unix.stackexchange.com/questions/16101/zsh-search-history-on-up-and-down-keys
# Cycle through history based on characters already typed on the line
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "$key[Up]" up-line-or-beginning-search
bindkey "$key[Down]" down-line-or-beginning-search

# zstyle pattern for the completion
# :completion:<function>:<completer>:<command>:<argument>:<tag>

# ZSH Completion w/ correct colors.
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' list-colors ''

# ZSH List Directories First
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-dirs-first true
# ZSH List dotfiles first: Need to use "file-sort".

# ZSH Highlight on Tab (allows you to select in a menu)
zstyle ':completion:*' menu select

autoload -Uz compinit && compinit # Use modern completion system.

# Other zstyle defaults (newuser.zshrc.recommended)
# zstyle ':completion:*' auto-description 'specify: %d'
# zstyle ':completion:*' completer _expand _complete _correct _approximate
# zstyle ':completion:*' format 'Completing %d'
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*' menu select=2
# zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
# zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
# zstyle ':completion:*' menu select=long
# zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
# zstyle ':completion:*' use-compctl false
# zstyle ':completion:*' verbose true
# zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
# zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# typeset = Set or display attributes and values for shell parameters.
# -U = When displaying the PATH, keep only the first occurrence of each duplicated value.
typeset -U PATH path

# Aliases (Linux)

# ls (https://github.com/coreutils/coreutils/blob/master/src/ls.c)
# --color is equivalent to --color=always
# Folders first, Then other files AND Sort by UTF-8 (dotfiles grouped together).
# -v --group-directories-first
alias ls="ls -v -h --color --group-directories-first" # Dotfiles fist + Human Readable + Color + Folders first.
# The problem with "-v" is that the file ordering is now case-sensitive.
# There is a hack to get the ordering I want. But it requires some external file modification.
# https://unix.stackexchange.com/questions/288333/how-can-i-make-ls-show-dotfiles-first-while-staying-case-insensitive
alias la="ls -A" # Include hidden files.
alias ll="ls -l" # Use long listing format.
alias lla="ll -A" # Use long listing format + Include hidden files.

# exa (https://github.com/ogham/exa)
# An alternative to ls. Writen in Rust + Installed on Rust toolchain.
alias exa="exa --git --group-directories-first"
alias exal="exa --long --header --git --group-directories-first"
# exa -a
# exal -a
# (ls) = exa --long --header --git --group-directories-first
# (la) = exa -a --long --header --git --group-directories-first
# Grid: exa --long --grid
# Tree Structure: exa --long --tree

# grep (Apparently not part of GNU Coreutils)
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias pip="/usr/bin/python -m pip" # Adding an alias for pip.

# Most Popular ZSH Extensions (https://safjan.com/top-popular-zsh-plugins-on-github/)
# ZSH Auto-Suggestions (https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md)
. ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# ZSH Syntax Highlighting (https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)
. ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# ZSH Sudo Plugin = ESC ESC (https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/sudo/sudo.plugin.zsh)
. ~/.zsh/zsh-sudo/sudo.zsh

# Fixed Highlighting Issues with "$".
# https://github.com/zsh-users/zsh-syntax-highlighting/issues/510
ZSH_HIGHLIGHT_STYLES[comment]='none'

# Starship
eval "$(starship init zsh)"

# Zoxide (Chosen over z-zsh)
# # https://old.reddit.com/r/zsh/comments/hid56f/which_autojump_plugin_should_i_use_what_is_the
eval "$(zoxide init zsh)"
