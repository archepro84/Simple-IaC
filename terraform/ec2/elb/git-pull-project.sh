# Update linux apt package manager
sudo apt-get update


# install curl, git
sudo apt-get install curl git -y

# install node version manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# Add Environment Path
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# node:16 latest install
nvm install 16

# nvm use node:16
nvm use 16

# github project install
git clone -b Simple-IaC --single-branch https://github.com/archepro84/prac-ORM.git

# directory move
cd prac-ORM/typeorm

# project instal
npm install

# Start node project
npm run start