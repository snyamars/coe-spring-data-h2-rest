FROM marvambass/oracle-java8
RUN mkdir -p /usr/src/myapp
WORKDIR .
ADD ./target/coe-spring-data-h2-rest-0.0.1-SNAPSHOT.jar /usr/src/myapp/coe-spring-data-h2-rest-0.0.1-SNAPSHOT.jar
#WORKDIR /usr/src/myapp
VOLUME /tmp
EXPOSE 8090
CMD echo "The application will start in 3s..." && \
        java -jar /usr/src/myapp/coe-spring-data-h2-rest-0.0.1-SNAPSHOT.jar
