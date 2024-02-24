ARG BASE_IMAGE=eclipse-temurin:17-jre-focal
ARG BUILD_IMAGE=eclipse-temurin:17-jdk-focal

FROM ${BUILD_IMAGE} as build

WORKDIR /builder

RUN apt-get update && apt-get install -y git
RUN git clone -b dev https://github.com/ViaVersion/VIAaaS.git VIAaaS

WORKDIR /builder/VIAaaS
RUN ./gradlew build

FROM ${BASE_IMAGE} as final

ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT

COPY /root /

WORKDIR /app
COPY --from=build /builder/VIAaaS/build/libs/VIAaaS-*-all.jar /app/VIAaaS-all.jar

STOPSIGNAL SIGTERM

ENTRYPOINT ["/docker-entrypoint.sh"]
EXPOSE 25565/tcp
EXPOSE 25543/tcp
