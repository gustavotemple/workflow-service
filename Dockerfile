# mvn clean package spring-boot:repackage -Dmaven.test.skip=true
# docker rmi choerodon-workflow
# docker build -t choerodon-workflow -f Dockerfile .

FROM ubuntu:bionic

RUN apt-get update && \
    apt-get install -y openjdk-8-jdk openjdk-8-dbg wget

USER root
WORKDIR /root
VOLUME /tmp
VOLUME /root/async-profiler
EXPOSE 8065

COPY target/app.jar /root/app.jar

CMD ["java", "-jar", "app.jar"]
