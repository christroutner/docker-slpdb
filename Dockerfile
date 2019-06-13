FROM christroutner/ct-base-ubuntu
MAINTAINER Chris Troutner <chris.troutner@gmail.com>

RUN apt-get update -y

RUN apt-get install -y autoconf libtool
RUN npm install -g typescript

#Set the working directory to be the home directory
WORKDIR /home/safeuser

# Switch to user account.
USER safeuser
# Prep 'sudo' commands.
#RUN echo 'abcd8765' | sudo -S pwd

# Clone the Bitcore repository
WORKDIR /home/safeuser
RUN git clone https://github.com/christroutner/SLPDB
WORKDIR /home/safeuser/SLPDB
RUN npm install
COPY config.ts config.ts

VOLUME /home/safeuser/SLPDB/_leveldb

COPY startup-script.sh startup-script.sh
CMD ["./startup-script.sh"]

