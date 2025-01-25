# ~/.bashrc - The Ultimate Personalized Bash Configuration for Siddhesh Lakhani

# Enable bash completion if available
if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
fi

# function to animate text
animate_text() {
    text="$1"
    for (( i=0; i<${#text}; i++ )); do
        echo -n "${text:$i:1}"
        sleep 0.03  # Faster animation for a more intense "hacker" feel
    done
    echo
}

# Color for hacker vibe (Green on black)
echo -e "\033[1;32m"  # Set text color to green for that classic hacker look

# Animated Welcome message (hacker style)
animate_text "Welcome, Siddhesh! 🌟"

# Animated What are we working on today? message
animate_text "What are we working on today? 🚀"

# Reset to default color
echo -e "\033[0m"

# Quote of the Day Section (with Vibrant and Stylish Design)
quotes=(
    "'Success is the sum of small efforts, repeated day in and day out.' - Robert Collier"
    "'The best way to predict the future is to create it.' - Abraham Lincoln"
    "'Success is not final, failure is not fatal: It is the courage to continue that counts.' - Winston Churchill"
    "'It does not matter how slowly you go as long as you do not stop.' - Confucius"
    "'Hard work beats talent when talent doesn't work hard.' - Tim Notke"
    "'The only limit to our realization of tomorrow is our doubts of today.' - Franklin D. Roosevelt"
)

# Randomly select a quote
random_quote=${quotes[$RANDOM % ${#quotes[@]}]}

# Vibrant and Stylish Quote Display
echo -e "\033[1;33m"  # Set a vibrant yellow color for the label
echo -e -n "    🌟  Quote of the Day  🌟 : "  # Print label on the same line
echo -e "\033[1;36m"  # Set a bright cyan color for the quote text
echo -e "   $random_quote"
echo -e "\033[0m"  # Reset to default color


# Stylish Prompt with Git Branch and Custom Emojis (Compact)
parse_git_branch() {
    git branch 2>/dev/null | grep '*' | sed 's/* //'
}
export PS1="\[\033[1;34m\][\[\033[1;32m\]\u@\h\[\033[1;34m\]] \[\033[1;36m\]\w\[\033[1;33m\]\$(parse_git_branch)\[\033[1;34m\]λ \[\033[0m]"

# Enable Colors for Commands and Custom Aliases
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

# Enhance Command Line History for Better Productivity
export HISTSIZE=10000
export HISTFILESIZE=20000
shopt -s histappend
shopt -s cmdhist
PROMPT_COMMAND="history -a"

# Archive Extraction Function for Easy Unpacking
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

# Add a Fancy Divider for Readability (Compact)
divider() {
    echo -e "\033[1;34m══════════════════════════════════════════════════════════\033[0m"
}
alias div='divider'

# User-Specific Environment Settings
export PATH=$PATH:~/.local/bin
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Set Default Editor to Vim
export VISUAL=vim
export EDITOR=vim

# Enable Git Prompt and Show Dirty Git Status (if Git is installed)
if command -v git &>/dev/null; then
    source /usr/share/git/completion/git-completion.bash
    source /usr/share/git/completion/git-prompt.sh
    export GIT_PS1_SHOWDIRTYSTATE=1
    export GIT_PS1_SHOWUPSTREAM="auto"
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(__git_ps1 " (%s)")\$ '
fi

# Advanced History Management with Searchability
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE="ls:cd:cd -:pwd:exit"

# Set Terminal Colors and Preferences
export TERM=xterm-256color
alias cls='clear'

# Enable Better Autocompletion for Package Management (Pacman)
complete -C /usr/bin/pacman pacman

# File Management Aliases with Interactive Prompts
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Enable Directory-Based History Search (TAB Completion)
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

# Enable Command Completion for History Search (Ctrl+R)
bind '"\C-r": reverse-search-history'

# Custom Function for Quick Directory Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'