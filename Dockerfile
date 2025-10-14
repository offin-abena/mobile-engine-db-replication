FROM docker.elastic.co/logstash/logstash:8.14.3

USER root

# Install the JDBC output plugin
#RUN bin/logstash-plugin install logstash-output-jdbc

# Copy MySQL connector JAR
COPY drivers/mysql-connector-j-8.0.33.jar /usr/share/logstash/logstash-core/lib/jars/

# Fix permissions
RUN chmod 644 /usr/share/logstash/logstash-core/lib/jars/mysql-connector-j-8.0.33.jar && \
    chown logstash:logstash /usr/share/logstash/logstash-core/lib/jars/mysql-connector-j-8.0.33.jar

USER logstash
