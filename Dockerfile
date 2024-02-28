ARG BASE_IMAGE=eclipse-temurin:21-jre-alpine
#ARG BUILD_IMAGE=eclipse-temurin:17-jdk

#FROM ${BUILD_IMAGE} as viaaas-build

#ARG TARGETOS
#ARG TARGETARCH
#ARG TARGETVARIANT

#WORKDIR /builder

#RUN apt-get update && apt-get install -y git
#RUN git clone -b dev https://github.com/ViaVersion/VIAaaS.git VIAaaS

#WORKDIR /builder/VIAaaS
#RUN ./gradlew build --no-daemon

FROM ${BASE_IMAGE} as final

ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT

RUN apk add curl
COPY /root /

WORKDIR /app
#COPY --from=viaaas-build /builder/VIAaaS/build/libs/VIAaaS-*-all.jar /app/VIAaaS-all.jar
RUN --mount=type=secret,id=JITPACK_TOKEN \
    curl -u$(cat /run/secrets/JITPACK_TOKEN) -Lf --output /app/VIAaaS-all.jar "https://jitpack.io/com/github/ViaVersion/VIAaaS/dev-SNAPSHOT/VIAaaS-dev-SNAPSHOT-all.jar"

STOPSIGNAL SIGTERM

ENTRYPOINT ["/docker-entrypoint.sh"]
EXPOSE 25565/tcp
EXPOSE 25543/tcp
