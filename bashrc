# ~/.bashrc: executed by bash(1) for non-login shells.

# If running interactively, we'll do things
if [[ $- == *i* ]]; then

  # User specific aliases and functions
  # Colors for terminal prompts
  PS1="\[\033[0;32m\]\u\[\033[0m\]@\[\033[0;34m\]\h\[\033[0m\]:\[\033[0;36m\]\w\[\033[0m\]$ "

  # Enable color support of ls and other commands
  alias ls='ls --color=auto'
  alias ll='ls -l'
  alias la='ls -A'
  alias l='ls -CF'

  # Directory navigation
  alias ..='cd ..'
  alias ...='cd ../..'
  alias ....='cd ../../..'

  # Useful shortcuts
  alias update='sudo pacman -Syu'  # Update system (Pacman)
  alias search='pacman -Ss'  # Search for package (Pacman)
  alias install='sudo pacman -S'  # Install package (Pacman)
  alias remove='sudo pacman -R'  # Remove package (Pacman)

  # Autocompletion for package management (useful for pacman)
  complete -C /usr/bin/pacman pacman

  # Set default editor (vim)
  export VISUAL=vim
  export EDITOR=vim

  # System information on login
  # Show a nice welcome message
  echo -e "\n╔══════════════════════════════════════════════════════════╗"
  echo -e "║                                                          ║"
  echo -e "║   Welcome back, Siddhesh! 🌟                             ║"
  echo -e "║   Ready to conquer the world of coding today? 🚀         ║"
  echo -e "║                                                          ║"
  echo -e "╚══════════════════════════════════════════════════════════╝\n"

  # Customizable terminal theme
  export TERM=xterm-256color
  alias cls='clear'

  # Enable Git prompt (if git is installed)
  if command -v git &>/dev/null; then
    source /usr/share/git/completion/git-completion.bash
    source /usr/share/git/completion/git-prompt.sh
    export GIT_PS1_SHOWDIRTYSTATE=1
    export GIT_PS1_SHOWUPSTREAM="auto"
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(__git_ps1 " (%s)")\$ '
  fi

  # Aliases for common file management
  alias cp='cp -i'  # Prompt before overwriting
  alias mv='mv -i'  # Prompt before overwriting
  alias rm='rm -i'  # Prompt before removing files

  # Enable directory-based history search
  bind 'set show-all-if-ambiguous on'
  bind 'TAB:menu-complete'

  # Enable command completion for history (Ctrl+R)
  bind '"\C-r": reverse-search-history'

fi

# Add extra paths if needed
# export PATH=$PATH:/path/to/custom/dir

# End of custom ~/.bashrc
