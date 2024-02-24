ARG BASE_IMAGE=eclipse-temurin:21-jre-alpine
ARG BUILD_IMAGE=eclipse-temurin:21-jdk-alpine

FROM ${BUILD_IMAGE} as viaaas-build

ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT

WORKDIR /builder

RUN apk add git
RUN git clone -b dev https://github.com/ViaVersion/VIAaaS.git VIAaaS

WORKDIR /builder/VIAaaS
ENV GRADLE_OPTS="-Xmx512m -Dorg.gradle.daemon=false"
RUN ./gradlew build

FROM ${BASE_IMAGE} as final

ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT

COPY /root /

WORKDIR /app
COPY --from=viaaas-build /builder/VIAaaS/build/libs/VIAaaS-*-all.jar /app/VIAaaS-all.jar

STOPSIGNAL SIGTERM

ENTRYPOINT ["/docker-entrypoint.sh"]
EXPOSE 25565/tcp
EXPOSE 25543/tcp
