FROM arm32v7/debian:stable-slim

RUN apt-get update
RUN apt-get -y install wget

WORKDIR /usr/src

ENV DOGECOIN_VERSION 1.14.3
ENV DOGECOIN_FILE arm-linux-gnueabihf.tar.gz

RUN wget https://github.com/dogecoin/dogecoin/releases/download/v${DOGECOIN_VERSION}/dogecoin-${DOGECOIN_VERSION}-${DOGECOIN_FILE}
RUN tar zxvf dogecoin-${DOGECOIN_VERSION}-${DOGECOIN_FILE}
RUN chmod +x dogecoin-${DOGECOIN_VERSION}/bin/dogecoind
RUN chmod +x dogecoin-${DOGECOIN_VERSION}/bin/dogecoin-cli
RUN ln -s /usr/src/dogecoin-${DOGECOIN_VERSION}/bin/dogecoind /usr/bin/dogecoind
RUN ln -s /usr/src/dogecoin-${DOGECOIN_VERSION}/bin/dogecoin-cli /usr/bin/dogecoin-cli

EXPOSE 22555 22556

CMD ["dogecoind", "-printtoconsole", "-datadir=/root/.dogecoin"]