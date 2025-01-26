# ~/.bashrc - The Ultimate Personalized Bash Configuration for Siddhesh Lakhani

# Colors
BLUE="\033[1;34m"
GREEN="\033[1;32m"
CYAN="\033[1;36m"
YELLOW="\033[1;33m"
RESET="\033[0m"

# Name 
NAME="sid"

# Loading effect
echo -e "Initializing your coding space..."
sleep 0.6
echo -e "Loading modules..."
sleep 0.6
echo -e "Almost ready...\n${RESET}"
sleep 0.6

# ASCII banner
echo -e "${BLUE}"
cat << "EOF"
    ███████╗██╗██████╗ ██╗      █████╗ ██╗  ██╗██╗  ██╗ █████╗ ███╗   ██╗██╗
    ██╔════╝██║██╔══██╗██║     ██╔══██╗██║ ██╔╝██║  ██║██╔══██╗████╗  ██║██║
    ███████╗██║██║  ██║██║     ███████║█████╔╝ ███████║███████║██╔██╗ ██║██║
    ╚════██║██║██║  ██║██║     ██╔══██║██╔═██╗ ██╔══██║██╔══██║██║╚██╗██║██║
    ███████║██║██████╔╝███████╗██║  ██║██║  ██╗██║  ██║██║  ██║██║ ╚████║██║
    ╚══════╝╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝
                                                
EOF
echo -e "${RESET}"
sleep 0.2                                                                           


# Quote of the Day (randomly selected from an array)
quotes=(
    "'The only way to do great work is to love what you do.' - Steve Jobs"
    "'First, solve the problem. Then, write the code.' - John Johnson"
    "'Code is like humor. When you have to explain it, it’s bad.' - Cory House"
    "'Programs must be written for people to read, and only incidentally for machines to execute.' - Harold Abelson"
    "'Simplicity is the soul of efficiency.' - Austin Freeman"
    "'In order to be irreplaceable, one must always be different.' - Coco Chanel (applies to unique code!)"
    "'There are only two hard things in computer science: cache invalidation, naming things, and off-by-one errors.' - Martin Fowler"
    "'The best error message is the one that never shows up.' - Thomas Fuchs"
    "'If you don’t program with love, you will miss the beauty in the work you do.' - Unknown"
    "'The most important thing is to have a great team of people around you.' - Mark Zuckerberg"
)
random_quote=${quotes[$RANDOM % ${#quotes[@]}]}

# Display the quote with a vibrant style
echo -e "${YELLOW}Welcome to your coding space, ${NAME}!"
echo -e "${CYAN}"  # Bright cyan text color
echo -e "$random_quote"
echo -e "${RESET}"  # Reset to default color

# Enable bash completion if available
if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
fi

# Stylish and compact prompt with Git branch info
parse_git_branch() {
    git branch 2>/dev/null | grep '*' | sed 's/* //'
}
export PS1="\[${BLUE}\][\[${GREEN}\]\u@\h\[${BLUE}\]] \[${CYAN}\]\w\[${YELLOW}\]\$(parse_git_branch)\[${BLUE}\]λ \[${RESET}\]"

# Color-enhanced aliases for common commands
alias ll='ls -lah --color=auto'
alias la='ls -A --color=auto'
alias l='ls --color=auto'
alias c='clear'
alias gs='git status'
alias gd='git diff'
alias gp='git pull'
alias push='git push'
alias update='sudo pacman -Syu'
alias remove='sudo pacman -Rns'
alias reboot='sudo systemctl reboot'
alias shutdown='sudo systemctl poweroff'

# Enhanced command line history settings
export HISTSIZE=10000
export HISTFILESIZE=20000
shopt -s histappend
shopt -s cmdhist
PROMPT_COMMAND="history -a"

# Archive extraction helper function
extract() {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2) tar xvjf "$1" ;;
            *.tar.gz) tar xvzf "$1" ;;
            *.bz2) bunzip2 "$1" ;;
            *.rar) unrar x "$1" ;;
            *.gz) gunzip "$1" ;;
            *.tar) tar xvf "$1" ;;
            *.tbz2) tar xvjf "$1" ;;
            *.tgz) tar xvzf "$1" ;;
            *.zip) unzip "$1" ;;
            *.Z) uncompress "$1" ;;
            *.7z) 7z x "$1" ;;
            *) echo "Cannot extract '$1'" ;;
        esac
    else
        echo "'$1' is not a valid file."
    fi
}

# Divider function for terminal output readability
divider() {
    echo -e "${BLUE}══════════════════════════════════════════════════════════${RESET}"
}
alias div='divider'

# Environment settings
export PATH=$PATH:~/.local/bin
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Default editor
export VISUAL=vim
export EDITOR=vim

# Enable Git prompt with dirty status (if Git is available)
if command -v git &>/dev/null; then
    source /usr/share/git/completion/git-completion.bash
    source /usr/share/git/completion/git-prompt.sh
    export GIT_PS1_SHOWDIRTYSTATE=1
    export GIT_PS1_SHOWUPSTREAM="auto"
fi

# Advanced history management
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE="ls:cd:cd -:pwd:exit"

# Terminal color and preferences
export TERM=xterm-256color
alias cls='clear'

# Enable better autocompletion for pacman
complete -C /usr/bin/pacman pacman

# Safer file management aliases
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Quick directory navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Enable directory-based history search and better completion
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

# Enable reverse search with Ctrl+R
bind '"\C-r": reverse-search-history'

# Custom system monitor shortcut using htop
alias monitor='htop'
