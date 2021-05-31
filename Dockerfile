FROM ubuntu:20.04

RUN     apt-get -y update && \
        apt-get -y --no-install-recommends install curl ca-certificates unzip && \
        apt-get autoremove -y && apt-get clean -y

RUN wget https://storage.googleapis.com/bysh-chef-files/olaris-release/olaris-linux-amd64-v0.3.3.zip
RUN olaris-linux-amd64-v0.3.3.zip
EXPOSE 8080

ENV LOGTOSTDERR=1
ENV V=4
COPY run.sh .
RUN chmod +x run.sh
CMD ["bash","run.sh"]
