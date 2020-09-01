# Alpine Linux with OpenJDK JRE
FROM maven:3.6.3-jdk-8 as target
#COPY . /app
COPY ./jirecon.properties /config/jirecon.properties
WORKDIR /app
COPY pom.xml .
COPY src/ /app/src/
RUN mvn dependency:go-offline
RUN mvn package
# Step : Package image
FROM openjdk:8-jre-alpine
#FROM parrotstream/ubuntu-java:xenial-8
#RUN apt-get update -y
#RUN apt-get install pulseaudio alsa-utils -y
#RUN modprobe snd_bcm2835
#RUN apt-get install avahi-utils -y
#RUN apt-get install pulseaudio -y
#CMD exec java $JAVA_OPTS -jar /app/app.jar
RUN apk --update add
RUN apk add pulseaudio-dev alsa-utils
COPY ./jirecon.properties /config/jirecon.properties
COPY ./jirecon.properties /root/.sip-communicator/config/jirecon.properties
#COPY --from=target /app/target/jirecon-0.0.1-SNAPSHOT.jar /app/app.jar
COPY --from=target /app/target/*jar-with-dependencies.jar /app/app.jar
WORKDIR /app
#RUN ["/usr/local/bin/mvn-entrypoint.sh", "mvn", "verify", "clean", "--fail-never"]
#CMD ["mvn", "exec:java", "-Dexec.mainClass=org.jitsi.jirecon.Main", "-Dconf=/config/jirecon.properties", "-Dtime=20", "-Dluan"]
#COPY ./target/jirecon-0.0.1-SNAPSHOT.jar /app.jar
# run application with this command line 
CMD ["java", "-jar", "./app.jar", "--conf=/config/jirecon.properties", "--time=20", "XXX@conference.example.com"]


