### Dockerfile for JanusGraph 0.3.1 ###
FROM openjdk:jre-slim
MAINTAINER armand.leopold@outlook.com

RUN apt-get update
RUN apt-get install -y wget unzip
RUN wget https://github.com/JanusGraph/janusgraph/releases/download/v0.3.1/janusgraph-0.3.1-hadoop2.zip
RUN unzip janusgraph-0.3.1-hadoop2.zip
RUN rm janusgraph-0.3.1-hadoop2.zip
RUN rm -rf /janusgraph-0.3.1-hadoop2/javadocs
RUN rm -rf /janusgraph-0.3.1-hadoop2/examples

EXPOSE 8182
VOLUME ["/janusgraph-0.3.1-hadoop2/data","/janusgraph-0.3.1-hadoop2/conf","/janusgraph-0.3.1-hadoop2/log"]

WORKDIR /janusgraph-0.3.1-hadoop2
ENTRYPOINT ["/janusgraph-0.3.1-hadoop2/bin/gremlin-server.sh", "/janusgraph-0.3.1-hadoop2/conf/gremlin-server/gremlin-server.yaml"]
