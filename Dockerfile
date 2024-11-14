ARG BASE_IMAGE=eclipse-temurin:21-jre-alpine
FROM ${BASE_IMAGE} as final

ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT

COPY /root /

RUN apk add unzip
WORKDIR /build
ADD "https://nightly.link/ViaVersion/VIAaaS/workflows/gradle/master/Artifacts.zip" /build/Artifacts.zip
RUN unzip Artifacts.zip

WORKDIR /app
RUN mv /build/VIAaaS-*-all.jar /app/VIAaaS-all.jar
RUN rm -rf /build

STOPSIGNAL SIGTERM

ENTRYPOINT ["/docker-entrypoint.sh"]
EXPOSE 25565/tcp
EXPOSE 25543/tcp
