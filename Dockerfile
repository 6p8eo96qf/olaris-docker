FROM node:lts-buster
COPY setup.sh .
RUN bash setup.sh


RUN     apt-get -y update && \
        apt-get -y --no-install-recommends install curl ca-certificates unzip && \
        apt-get autoremove -y && apt-get clean -y

ADD run-olaris /opt/run-olaris
EXPOSE 8080

ENV LOGTOSTDERR=1
ENV PORT=8080
ENV V=4
COPY . .
CMD ["bash", "start.sh"]
