#!/usr/bin/env fish

# Change to your repo directory
cd /run/media/sidlakhani/external/repos/daily-commit

# Pull latest changes without rebasing
git pull --quiet --no-rebase origin main

# Randomly decide to commit (50% chance)
set do_commit (random 0 1)

if test $do_commit -eq 1
    set current_date (date "+%Y-%m-%d %H:%M:%S")
    echo "Committed on $current_date" >> daily_commit.txt
    git add daily_commit.txt
    git commit --quiet -m "Automated commit on $current_date"
    git push --quiet origin main
end

cd ~
