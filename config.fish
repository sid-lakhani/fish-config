set -Ux MCFLY_HISTFILE "$HOME/.local/share/fish/fish_history"

# Enable colors
set -gx BLUE "\033[1;34m"
set -gx GREEN "\033[1;32m"
set -gx CYAN "\033[1;36m"
set -gx YELLOW "\033[1;33m"
set -gx RESET "\033[0m"

# Name
set -gx NAME "sid"

# Loading effect
echo -e "Initializing your coding space..."
sleep 0.3
echo -e "Loading modules..."
sleep 0.3
echo -e "Almost ready...\n$RESET"
sleep 0.3

# ASCII banner
echo -e "$BLUE"
echo "
 ███████╗██╗██████╗ ██╗      █████╗ ██╗  ██╗██╗  ██╗ █████╗ ███╗   ██╗██╗
 ██╔════╝██║██╔══██╗██║     ██╔══██╗██║ ██╔╝██║  ██║██╔══██╗████╗  ██║██║
 ███████╗██║██║  ██║██║     ███████║█████╔╝ ███████║███████║██╔██╗ ██║██║
 ╚════██║██║██║  ██║██║     ██╔══██║██╔═██╗ ██╔══██║██╔══██║██║╚██╗██║██║
 ███████║██║██████╔╝███████╗██║  ██║██║  ██╗██║  ██║██║  ██║██║ ╚████║██║
 ╚══════╝╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝
"
echo -e "$RESET"
sleep 0.1

# Define the array of quotes
set quotes "'The only way to do great work is to love what you do.' - Steve Jobs" \
           "'First, solve the problem. Then, write the code.' - John Johnson" \
           "'Code is like humor. When you have to explain it, it’s bad.' - Cory House" \
           "'Programs must be written for people to read, and only incidentally for machines to execute.' - Harold Abelson" \
           "'Simplicity is the soul of efficiency.' - Austin Freeman" \
           "'In order to be irreplaceable, one must always be different.' - Coco Chanel" \
           "'There are only two hard things in computer science: cache invalidation, naming things, and off-by-one errors.' - Martin Fowler" \
           "'The best error message is the one that never shows up.' - Thomas Fuchs" \
           "'If you don’t program with love, you will miss the beauty in the work you do.' - Unknown" \
           "'The most important thing is to have a great team of people around you.' - Mark Zuckerberg"

# Get a random index (Fish uses 1-based indexing)
set random_index (math (random) % (count $quotes) + 1)

# Select and print a random quote
set random_quote $quotes[$random_index]
echo -e "$CYAN $random_quote"

echo -e " \n\e[33m ╔══════════════════════════════════════════╗"
echo -e " ║  🚀 Welcome to your coding space, $NAME!   ║"
echo -e " ╚══════════════════════════════════════════╝\e[0m\n"


# Aliases (Fish uses "abbr" instead of "alias" for temporary aliases)
abbr -a ll "ls -lah"
abbr -a la "ls -A"
abbr -a l "ls"
abbr -a c "clear"
abbr -a gs "git status"
abbr -a gd "git diff"
abbr -a gp "git pull"
abbr -a gc "git commit -m"
abbr -a add "git add ."
abbr -a push "git push"
abbr -a pull "git pull"
abbr -a remove "sudo pacman -Rns"
abbr -a reboot "sudo systemctl reboot"
abbr -a shutdown "sudo systemctl poweroff"
abbr -a yay-update "yay -Syu --devel"
abbr -a yay-search "yay -Ss"
abbr -a yay-remove "yay -Rns"
abbr -a .. "cd .."
abbr -a ... "cd ../.."
abbr -a .... "cd ../../.."
abbr -a home "cd ~"
abbr -a dl "cd ~/Downloads"
abbr -a dt "cd ~/Desktop"
abbr -a docs "cd ~/Documents"
abbr -a clg "cd /run/media/sidlakhani/external/clg/sem6"
abbr -a work "cd /run/media/sidlakhani/external/work"
abbr -a repos "cd /run/media/sidlakhani/external/repos"
abbr -a me "cd /run/media/sidlakhani/external/personal"
abbr -a pac-refresh "sudo pacman -Syy"
abbr -a pac-search "pacman -Ss"
abbr -a pac-install "sudo pacman -S"
abbr -a pac-remove "sudo pacman -Rns"
abbr -a sysinfo "neofetch"
abbr -a uptime "uptime -p"
abbr -a cpu "lscpu"
abbr -a gpu "glxinfo | grep OpenGL"
abbr -a src "source ~/.config/fish/config.fish"
abbr -a fishconfig "nano ~/.config/fish/config.fish"
abbr -a fishhistory "history | less"
abbr -a auto "systemctl --user start daily-commit.service"

# Aliases for easy use 
alias btop="btop --utf-force"
alias bye="exit"
alias update="garuda-update"
alias cleanup="sudo pacman -Rns $(pacman -Qdtq)"
alias tt="cat sched.txt"

function whatsapp
    bg wasistlos $argv
end

function of
    bg onlyoffice-desktopeditors $argv
end

function pac-clean
    sudo pacman -Rns (pacman -Qdtq)
end

function yay-orphans
    yay -Rns (pacman -Qdtq)
end


# Set PATH
set -gx PATH $PATH ~/.local/bin

# Default editor
set -gx EDITOR vim
set -gx VISUAL vim

# Set terminal color
set -gx TERM xterm-256color

# Run apps in background
function bg
    nohup $argv &>/dev/null &; disown
end

# Git prompt (Fish handles Git branch display differently)
function fish_prompt
    set_color blue
    echo -n "["; set_color green
    echo -n (whoami)"@"(hostname)
    set_color blue
    echo -n "] "
    set_color cyan
    echo -n (prompt_pwd)
    set_color yellow
    set branch (git branch --show-current 2>/dev/null)
    if test -n "$branch"
        echo -n " ($branch)"
    end
    set_color blue
    echo -n " λ "
    set_color normal
end

# Archive extraction function
function extract
    if test -f $argv[1]
        switch $argv[1]
            case "*.tar.bz2"
                tar xvjf $argv[1]
            case "*.tar.gz"
                tar xvzf $argv[1]
            case "*.bz2"
                bunzip2 $argv[1]
            case "*.rar"
                unrar x $argv[1]
            case "*.gz"
                gunzip $argv[1]
            case "*.tar"
                tar xvf $argv[1]
            case "*.tbz2"
                tar xvjf $argv[1]
            case "*.tgz"
                tar xvzf $argv[1]
            case "*.zip"
                unzip $argv[1]
            case "*.7z"
                7z x $argv[1]
            case "*"
                echo "Cannot extract '$argv[1]'"
        end
    else
        echo "'$argv[1]' is not a valid file."
    end
end

# Better history handling
set -U fish_history (math (random) % 10000)

# Add fnm to PATH
set -gx PATH $HOME/.fnm:$PATH

