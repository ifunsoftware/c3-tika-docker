FROM ifunsoftware/c3-base:latest

# Add services configuration for supervisor
COPY conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Configure 'c3-next' service startup in supervisor
COPY conf/start_c3.sh /usr/bin/start_c3.sh
RUN chmod +x /usr/bin/start_c3.sh

# Fetch latest c3-next build
RUN wget -q -O /opt/virgo/pickup/c3-tika-server.war 'http://repository.ifunsoftware.com/service/local/artifact/maven/redirect?r=snapshots&g=org.aphreet.c3&a=c3-tika-server&v=LATEST&p=war' --content-disposition

EXPOSE 22 8080 8443

ENTRYPOINT ["/usr/bin/supervisord"]
