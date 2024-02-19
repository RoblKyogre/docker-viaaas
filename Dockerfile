ARG BASE_IMAGE=eclipse-temurin:17-jre-focal
FROM ${BASE_IMAGE}

ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT

COPY /root /

WORKDIR /app
RUN curl -Lf -o /app/VIAaaS-all.jar "https://jitpack.io/com/github/ViaVersion/VIAaaS/master-SNAPSHOT/VIAaaS-master-SNAPSHOT-all.jar"

STOPSIGNAL SIGTERM

ENTRYPOINT ["/docker-entrypoint.sh"]
EXPOSE 25565/tcp
EXPOSE 25543/tcp
