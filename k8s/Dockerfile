FROM openjdk:11-jdk

#RUN apk add tzdata
RUN cp /usr/share/zoneinfo/Asia/Seoul /etc/localtime
RUN echo "Asia/Seoul" > /etc/timezone

ENV LANG=ko_KR.UTF-8
ENV TZ="Asia/Seoul"

ADD ./build/libs/demo-app02-0.0.1-SNAPSHOT.jar app.jar

CMD ["java", "-jar", "app.jar"]
