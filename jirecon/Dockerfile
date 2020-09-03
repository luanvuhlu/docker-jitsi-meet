# Alpine Linux with OpenJDK JRE
FROM maven:3.6.3-jdk-8 as target
#COPY . /app
COPY ./jirecon.properties /config/jirecon.properties
WORKDIR /app
COPY pom.xml .
COPY src/ /app/src/
RUN mvn dependency:go-offline
RUN mvn package

# FROM openjdk:8-jre-alpine
FROM openjdk:8-jre-buster
# RUN apk --update add
# RUN set -xe \
#     && echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
#     && apk add --no-cache --purge -uU curl \
#         bluez bluez-libs bluez-firmware \
#         alsa-lib alsa-utils \
# 	libdaemon popt soxr libconfig avahi python3 mpg123 expect libressl2.7-libcrypto \
#         pulseaudio pulseaudio-dev pulseaudio-zeroconf pulseaudio-utils pulseaudio-alsa pulseaudio-bluez pulseaudio-jack \
#     && curl -o /usr/local/bin/pulsemixer -jkSL https://raw.githubusercontent.com/GeorgeFilipkin/pulsemixer/master/pulsemixer \
#     && chmod +x /usr/local/bin/pulsemixer \
#     && rm -rf /var/cache/apk/* /tmp/*

COPY ./jirecon.properties /config/jirecon.properties
COPY ./jirecon.properties /root/.sip-communicator/config/jirecon.properties
COPY --from=target /app/target/*jar-with-dependencies.jar /app/app.jar
WORKDIR /app
CMD ["java", "-jar", "./app.jar", "--conf=/config/jirecon.properties", "--time=20",  "XXX@muc.meet.jitsi"]



