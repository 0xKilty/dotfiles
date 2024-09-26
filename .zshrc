# Set the shell to zsh
# chsh -s $(which zsh)

# Install needed packages
# sudo apt install zsh-syntax-highlighting zsh-autosuggestions

# Enable colors
autoload -U colors && colors

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats ' (%b)'
setopt PROMPT_SUBST

# Change the prompt
PS1='%~${vcs_info_msg_0_} λ '

# History
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
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
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Able to use vi mode
bindkey -v
export KEYTIMEOUT=1

# Ctrl + e allows you to edit a command in vim
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Syntax highlighting
# sudo apt install zsh-syntax-highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Enable zsh-autosuggestions
# sudo apt install zsh-autosuggestions
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Add scripts folder
export PATH="$PATH:$HOME/.scripts"

# Ctrl + h searches the history
search_history() {
    printf "\n"
    $HOME/.scripts/hist
    zle reset-prompt
}

autoload search_history
zle -N search_history
bindkey "^H" search_history

# Ctrl + o changes the dir with lf
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# Aliases
alias sai="sudo apt install -y"
alias ls="ls --color=auto"
alias pm="git pull origin main"
alias c="clear"
alias update="sudo apt update && sudo apt upgrade"

# Typos
alias sl="ls"
alias dc="cd"
alias gti="git"
alias sduo="sudo"
alias sdo="sudo"
