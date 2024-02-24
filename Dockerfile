ARG BASE_IMAGE=alpine:latest
ARG BUILD_IMAGE=eclipse-temurin:17-jdk

FROM ${BUILD_IMAGE} as viaaas-build

ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT

WORKDIR /builder

RUN apt-get update && apt-get install -y git
RUN git clone -b dev https://github.com/ViaVersion/VIAaaS.git VIAaaS

WORKDIR /builder/VIAaaS
RUN ./gradlew build

FROM ${BUILD_IMAGE} as jre-build

ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT

RUN $JAVA_HOME/bin/jlink \
         --add-modules java.base \
         --strip-debug \
         --no-man-pages \
         --no-header-files \
         --compress=2 \
         --output /javaruntime

FROM ${BASE_IMAGE} as final

ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT

COPY /root /

ENV JAVA_HOME=/opt/java/openjdk
ENV PATH "${JAVA_HOME}/bin:${PATH}"
COPY --from=jre-build /javaruntime ${JAVA_HOME}

WORKDIR /app
COPY --from=viaaas-build /builder/VIAaaS/build/libs/VIAaaS-*-all.jar /app/VIAaaS-all.jar

STOPSIGNAL SIGTERM

ENTRYPOINT ["/docker-entrypoint.sh"]
EXPOSE 25565/tcp
EXPOSE 25543/tcp
