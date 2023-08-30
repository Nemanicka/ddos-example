FROM ubuntu:22.04

RUN apt-get update



RUN  apt-get install siege

COPY simulate.sh /usr/local/bin/simulate.sh

RUN chmod +x /usr/local/bin/simulate.sh

CMD /usr/local/bin/simulate.sh
