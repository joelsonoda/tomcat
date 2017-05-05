#! /bin/sh

echo "Writing the following properties to ${CATALINA_HOME}/conf/catalina.properties}"
eval "echo \"$(cat /root/reporting.properties)\""
eval "echo \"$(cat /root/reporting.properties)\"" 2> /dev/null >> ${CATALINA_HOME}/conf/catalina.properties

${CATALINA_HOME}/bin/catalina.sh run