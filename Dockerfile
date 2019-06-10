FROM christroutner/ct-base-ubuntu
MAINTAINER Chris Troutner <chris.troutner@gmail.com>

RUN apt-get update -y

#Set the working directory to be the home directory
WORKDIR /home/safeuser

# Switch to user account.
USER safeuser
# Prep 'sudo' commands.
#RUN echo 'abcd8765' | sudo -S pwd

# Clone the Bitcore repository
WORKDIR /home/safeuser
RUN git clone https://github.com/bitpay/bitcore
WORKDIR /home/safeuser/bitcore
RUN npm install
COPY bitcore.config.json bitcore.config.json


EXPOSE 3000

COPY startup-script.sh startup-script.sh
CMD ["./startup-script.sh"]
#CMD ["bitcoind", "-conf=/home/bitcoin/.bitcoin/bitcoin.conf", "-datadir=/data", "-disablewallet"]
