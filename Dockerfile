FROM frolvlad/alpine-oraclejdk8:slim
VOLUME /tmp
ADD gs-spring-boot-docker-0.1.0.jar k-hello-world-6.6.0.jar
RUN sh -c 'touch /k-hello-world-6.6.0.jar'
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /k-hello-world-6.6.0.jar -Dkms.url=${kms}" ]