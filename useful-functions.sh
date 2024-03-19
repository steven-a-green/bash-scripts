#!/bin/bash

###########################################################
# Bash Helper Functions that I leverage often
###########################################################

# Print an error message to stderr and exit
err() {  
    echo "$@" 1>&2; 
    exit 1;  
}

# Ensure script is run as root
check_root() {
    if [ "$(id -u)" != "0" ]; then 
        err "This script must be run as root"; 
    fi
}

# Function to ask for continuation
ask_continue() {
    local REPLY
    read -p "Would you like to continue (Y/N): " REPLY
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    err "Exiting script."
    fi
    echo "***** starting script *****"
}

# Re-tar a package
re_tar() {
    TARFOLDER=$(pwd)
    cd ..
    TARNAME=$(basename ${TARFOLDER})
    tar -czvf $TARNAME.tar.gz $TARNAME
}

# Command line arguments parsing examples
get_user_input() {
    menu() {
        echo "
        1) option1              3) option3
        2) option2              4) option4
        "
    }

    PS3='Please enter the number of your choice: '
    options=("single user add" "bulk add" "delete user" "print list of user UIDs" "print ldap search" "exit")
    select opt in "${options[@]}"
    do
    case $opt in
        "option1"|"option2"|"option3"|"option4")
        menu
        ;;
        "exit")
        exit
        ;;
        *)
        echo "Invalid option $REPLY"
        menu
        ;;
    esac
    done

    # Verify previous command was successful
    if [ $? -ne 0 ]; then
    echo "The command was not successful."
    # Handle failure
    fi
}

# Find and make tarball with xargs
find_and_tar() {
    sudo find . -iname $1 | xargs tar czvf /tmp/$1.tar.gz
}

# Send notification text (make sure to use your own phone number and key)
send_text() {
    curl --insecure -X POST https://textbelt.com/text \
    --data-urlencode phone='YOUR_PHONE_NUMBER' \
    --data-urlencode message='Hello, this is a message!' \
    -d key=YOUR_KEY
}

# Increment the version number in Linux style
inc_ver() {
    echo $VERSION | awk -F. -v OFS=. 'NF==1{print ++$NF}; NF>1{if(length($NF+1)>length($NF))$(NF-1)++; $NF=sprintf("%0*d", length($NF), ($NF+1)%(10^length($NF))); print}' > version.txt
}

# Backup Downloads folder in the /tmp folder
backup_downloads() {
    local user=${1:-$(whoami)}
    local input="/home/$user/Downloads"
    local output="/tmp/${user}_home_$(date +%Y-%m-%d_%H%M%S).tar.gz"

    tar -czf "$output" "$input" 2> /dev/null
    local src_files=$(find "$input" -type f | wc -l)
    local src_directories=$(find "$input" -type d | wc -l)
    local arch_files=$(tar -tzf "$output" | grep -v '/$' | wc -l)
    local arch_directories=$(tar -tzf "$output" | grep '/$' | wc -l)

    echo "########## $user ##########"
    echo "Files to be included: $src_files"
    echo "Directories to be included: $src_directories"
    echo "Files archived: $arch_files"
    echo "Directories archived: $arch_directories"

    if [ $src_files -eq $arch_files ]; then
    echo "Backup of $input completed!"
    ls -l "$output"
    else
    echo "Backup of $input failed!"
    fi
}

# Read the ID from /etc/os-release and print OS info
get_os_info() {
    OS=$(grep -oP '(?<=^ID=).+' /etc/os-release | tr -d '"')}

    case $OS in
    'rhel')
        echo "This is a RHEL machine."
        ;;
    'ubuntu')
        echo "This is an Ubuntu machine."
        ;;
    *)
        echo "This machine is running an operating system I don't recognize."
        ;;
    esac
}

# Color your script output
colorize_output() {
    local txtund=$(tput sgr 0 1) # Underline
    local txtbld=$(tput bold)    # Bold
    local txtred=$(tput setaf 1) # Red
    local txtgrn=$(tput setaf 2) # Green
    local txtylw=$(tput setaf 3) # Yellow
    local txtblu=$(tput setaf 4) # Blue
    local txtpur=$(tput setaf 5) # Purple
    local txtcyn=$(tput setaf 6) # Cyan
    local txtwht=$(tput setaf 7) # White
    local txtrst=$(tput sgr0)    # Text reset
}

#make the functions to funnel in the varibales in front of function arguements
red() {
    echo "${txtred}$1${txtrst}"
}
green() {
    echo "${txtgrn}$1${txtrst}"
}
blue() {
    echo "${txtblu}$1${txtrst}"
}

cyan() {
    echo "${txtcyn}$1${txtrst}"
}

yellow() {
    echo "${txtylw}$1${txtrst}"
}

purp() {
    echo "${txtpur}$1${txtrst}"
}
