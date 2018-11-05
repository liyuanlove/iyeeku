#!/bin/bash
. /etc/profile
#RUN_CLASS=com.iyeeku.watch.main.Main
#JAVA_OPTS="-Xms64M -Xmx128M -XX:MetaspaceSize=100m -XX:MaxMetaspaceSize=100m -Dkey=597E4335A9FE657664A294A6B7D332E6 -DadminPort=6060 -XX:HeapDumpPath=/commonapps/om/iyeekuWatch/om.dmp -Diyeeku.Name=/commonapps/iyeekuWatch"
#CLASS_PATH=".:./lib/c3p0-0.9.5.2.jar:./lib/mchange-commons-java-0.2.11.jar:./lib/mysql-connector-java-6.0.6.jar:./lib/ojdbc6-11.2.0.1.0.jar"
#java $JAVA_OPTS -classpath $CLASS_PATH $RUN_CLASS
/usr/lib/java/jdk1.8.0_152/jre/bin/java -Xms64M -Xmx128M -XX:MetaspaceSize=100m -XX:MaxMetaspaceSize=100m -Dkey=597E4335A9FE657664A294A6B7D332E6 -DadminPort=6060 -XX:HeapDumpPath=/commonapps/om/iyeekuWatch/om.dmp -Diyeeku.Name=/commonapps/iyeekuWatch -classpath .:./lib/c3p0-0.9.5.2.jar:./lib/mchange-commons-java-0.2.11.jar:./lib/mysql-connector-java-6.0.6.jar:./lib/ojdbc6-11.2.0.1.0.jar com.iyeeku.watch.main.Main