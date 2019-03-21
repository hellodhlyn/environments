FROM ubuntu:18.04

RUN apt update
RUN apt install sudo -y

RUN adduser --disabled-password tester
RUN adduser tester sudo
RUN echo 'tester ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
WORKDIR /home/tester

COPY ./devtools.sh /home/tester/devtools.sh
RUN chown -R tester:tester /home/tester

USER tester
CMD ["/home/tester/devtools.sh"]
