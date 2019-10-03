# A Docker container for running SLPDB. Updated images will be uploaded
# to Docker Hub:
# https://cloud.docker.com/u/christroutner/repository/docker/christroutner/slpdb-mainnet_slpdb

## BEGIN BOILERPLATE SETUP

FROM ubuntu:18.04
MAINTAINER Chris Troutner <chris.troutner@gmail.com>

# Update the OS and install any OS packages needed.
RUN apt-get update -y
RUN apt-get install -y sudo git curl nano gnupg wget

#Install Node and NPM
RUN curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt-get install -y nodejs build-essential

#Create the user 'safeuser' and add them to the sudo group.
RUN useradd -ms /bin/bash safeuser
RUN adduser safeuser sudo

#Set password to 'abcd8765' change value below if you want a different password
RUN echo safeuser:abcd8765 | chpasswd

#Set the working directory to be the users home directory
WORKDIR /home/safeuser

COPY dummyapp.js dummyapp.js
CMD ["node", "dummyapp.js"]

# END BOILERPLATE SETUP


# SLPDB specific packages
RUN apt-get install -y autoconf libtool
RUN npm install -g typescript

#Setup NPM for non-root global install (like on a mac)
RUN mkdir /home/safeuser/.npm-global
RUN chown -R safeuser .npm-global
RUN echo "export PATH=~/.npm-global/bin:$PATH" >> /home/safeuser/.profile
RUN runuser -l safeuser -c "npm config set prefix '~/.npm-global'"


# Switch to user account.
USER safeuser
# Prep 'sudo' commands.
#RUN echo 'abcd8765' | sudo -S pwd

# Clone the SLPDB repository
WORKDIR /home/safeuser
#RUN git clone https://github.com/christroutner/SLPDB
RUN git clone https://github.com/simpleledger/SLPDB

# Checkout the last QA'd version.
WORKDIR /home/safeuser/SLPDB
RUN git checkout 2524e0f4f9b9eb1b97feee64f8b3f24a936f7e19

# Install dependencies.
RUN npm install

# Call out the persistant volumes
VOLUME /home/safeuser/SLPDB/_leveldb
VOLUME /home/safeuser/config

COPY startup-script.sh startup-script.sh
CMD ["./startup-script.sh"]
