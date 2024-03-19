#!/bin/bash

# Configuration
repo_dir="bash-scripts" # Directory of your git repository
sleep_duration=60 # How long to wait (in seconds) before checking again

# Change to the specified directory
cd "$repo_dir" || exit

# Continuously check for changes
while true; do 
    # Check for changes using git fetch
    if git fetch --dry-run 2>&1 | grep -q 'up to date'; then
        echo "No changes detected"
    else
        echo "Changes detected"
        exit
    fi

    # Wait for the specified duration before checking again
    sleep "$sleep_duration"
done
