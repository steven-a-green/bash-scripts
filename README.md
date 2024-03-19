
# Bash Scripts Collection

Welcome to my collection of useful Bash scripts. This repository is a curated set of scripts that I have found to be helpful for automating tasks, simplifying workflows, and serving as a quick reference for Bash scripting techniques.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them:

```bash
# Example: Installing a necessary package
sudo apt-get install openssl
... actually will just write a script for this in the future
```

### Installing

A step-by-step series of examples that tell you how to get a development environment running:

```bash
# Clone this repository
git clone https://github.com/yourusername/bash-scripts.git

# Navigate into the repository
cd bash-scripts

# Make the script executable
chmod +x script-name.sh
```

## Usage

Here's a brief overview of how to use the scripts in this repository:

```bash
# Example usage for a script
./script-name.sh
```

Replace `script-name.sh` with the actual script you want to run.

Please refer to individual script files for detailed usage instructions.

## Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Scripts Description

- **check-repo-changes.sh**: copy this script in a repo directory or push it with your repo and it will check for changes but not pull them down. good for an autobuilder on a cron job running to build if changes to a repo.
- **configure-bashrc.sh**: configures your bashrc with a different look and adds all of the best alias's I have come across while driving linux machines.
- **encrypt-decrypt.sh**: perform symmetric key encryption/decryption on a folder. I use this to encrypt my Joplin notebook on a system that I do not own but leverage often.
- **useful-functions.sh**: collection of various functions that I will either source the bash file or just copy and paste the ones I need. i.e: getopts, check_root, retar a folder, colorize bash stdout, and more

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

## Acknowledgments

- All Linux users: you are the real heroes
