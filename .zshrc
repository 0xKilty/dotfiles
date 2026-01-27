# Set the shell to zsh
# chsh -s $(which zsh)

# Install needed packages
# sudo apt install zsh-syntax-highlighting zsh-autosuggestions

# Enable colors
autoload -U colors && colors

# Enable zsh-autosuggestions
# sudo apt install zsh-autosuggestions
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Change the prompt
PS1='%~ $ '

# History
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_SPACE
setopt INC_APPEND_HISTORY
setopt APPEND_HISTORY
setopt SHARE_HISTORY
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Typos
setopt CORRECT

# Tab completion
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zmodload zsh/complist
compinit

# Add scripts folder
export PATH="$PATH:$HOME/.scripts:/usr/games"

# Aliases
alias sai="sudo apt install -y"
alias sas="sudo apt search"
alias sar="sudo apt remove"
alias ls="ls --color=auto"
alias pm="git pull origin main"
alias pyvirt="python3 -m venv venv && source ./venv/bin/activate"
alias c="clear"
alias update="sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y"
alias hist='fc -rl 1 | awk "{\$1=\"\"; sub(/^ +/,\"\"); if (!seen[\$0]++) print \$0}" | fzf'

# Typos
alias sl="ls"
alias dc="cd"
alias gti="git"
alias sduo="sudo"
alias sdo="sudo"

bindkey -e
bindkey '^[[H' beginning-of-line   # Home
bindkey '^[[F' end-of-line         # End
bindkey '^[[3~' delete-char        # Delete
bindkey '^[[1;5C' forward-word     # Ctrl+Right
bindkey '^[[1;5D' backward-word    # Ctrl+Left

# Syntax highlighting
# sudo apt install zsh-syntax-highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
