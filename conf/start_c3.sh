#!/bin/sh

JAVA_HOME="$(update-java-alternatives -l | cut -d ' ' -f 3)" JAVA_OPTS="-Xmx1024m" /opt/virgo/bin/startup.sh
