FROM bellsoft/liberica-openjdk-debian:8

COPY ["bin", "/opt/apacheds/bin"]
COPY ["instances", "/opt/apacheds/instances"]
COPY ["lib", "/opt/apacheds/lib"]
COPY ["LICENSE", "NOTICE", "/opt/apacheds/"]

WORKDIR "/opt/apacheds"

EXPOSE 10389 10636
VOLUME ["/opt/apacheds/instances/default"]

ENTRYPOINT ["java"]
CMD [ \
     "-Dlog4j.configuration=/opt/apacheds/instances/default/conf/log4j.properties", \
     "-Dapacheds.log.dir=/opt/apacheds/instances/default/log", \
     "-Dapacheds.shutdown.port=0", \
     "-classpath","lib/*", \
     "org.apache.directory.server.UberjarMain","instances/default" \
]
