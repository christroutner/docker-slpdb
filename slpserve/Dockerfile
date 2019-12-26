FROM christroutner/ct-base-ubuntu
MAINTAINER Chris Troutner <chris.troutner@gmail.com>

RUN apt-get update -y

RUN apt-get install -y autoconf libtool

#Set the working directory to be the home directory
WORKDIR /home/safeuser

# Switch to user account.
USER safeuser
# Prep 'sudo' commands.
#RUN echo 'abcd8765' | sudo -S pwd

# Clone the Bitcore repository
WORKDIR /home/safeuser
RUN git clone https://github.com/christroutner/slpserve
#RUN git clone https://github.com/simpleledger/slpserve
#RUN git clone https://github.com/fountainhead-cash/slpserve
#RUN git clone https://github.com/blockparty-sh/slpserve
WORKDIR /home/safeuser/slpserve
RUN npm install
COPY env .env

CMD ["npm", "start"]

#COPY dummyapp.js dummyapp.js
#CMD ["node", "dummyapp.js"]

#COPY startup-script.sh startup-script.sh
#CMD ["./startup-script.sh"]
#CMD ["bitcoind", "-conf=/home/bitcoin/.bitcoin/bitcoin.conf", "-datadir=/data", "-disablewallet"]
