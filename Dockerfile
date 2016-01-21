FROM alpine:3.3

ENV JAVA_HOME=/usr/lib/jvm/default-jvm

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
 && apk --no-cache add openjdk8 git openssh && \
  adduser -D -s /bin/ash jenkins && \
  passwd -u jenkins && \
  chown -R jenkins:jenkins /home/jenkins && \
  echo "jenkins:jenkins" | chpasswd

RUN ln -sf "${JAVA_HOME}/bin/"* "/usr/bin/"

COPY entrypoint.sh /

EXPOSE 22
ENTRYPOINT ["/entrypoint.sh"]