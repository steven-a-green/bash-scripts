#!/bin/bash

read -p "Do you want to (e)ncrypt or (d)ecrypt a folder? " choice
folder_path="/mnt/c/Users/sgreen/.config/"
folder_name="joplin-desktop"

if [[ "$choice" == "e" ]]; then
    echo "Encrypting..."
    # Compressing the folder using tar.gz
    cd "$folder_path" || exit
    tar -czf "${folder_name}.tar.gz" "$folder_name"
    # Encrypting the tar.gz file. OpenSSL will prompt for the password.
    openssl enc -aes-256-cbc -salt -pbkdf2 -iter 10000 -in "${folder_name}.tar.gz" -out "${folder_name}.tar.gz.enc"
    # Removing the original tar.gz file
    rm "${folder_name}.tar.gz"
    rm -r "$folder_name"
    echo "Folder encrypted successfully to ${folder_name}.tar.gz.enc"
elif [[ "$choice" == "d" ]]; then
    echo "Decrypting..."
    # Decrypting the .tar.gz.enc file. OpenSSL will prompt for the password.
    cd "$folder_path" || exit
    openssl enc -aes-256-cbc -d -pbkdf2 -iter 10000 -in "${folder_name}.tar.gz.enc" -out "${folder_name}_decrypted.tar.gz"
    # Removing the encrypted .tar.gz.enc file 
    rm "${folder_name}.tar.gz.enc"
    # Extracting the decrypted tar.gz file
    tar -xzf "${folder_name}_decrypted.tar.gz"
    # Removing the decrypted tar.gz file
    rm "${folder_name}_decrypted.tar.gz"
    echo "Folder decrypted successfully."
else
    echo "Invalid choice."
fi
