@echo off

set RUN_CLASS="com.iyeeku.watch.main.Main"

rem set JAVA_OPTION="-Dkey=597E4335A9FE657664A294A6B7D332E6 -Djava.encoding=UTF-8 -Xms100M -Xmx100M -server"

set JAVA_OPTION="-Dkey=597E4335A9FE657664A294A6B7D332E6"

set CLASSPATH=".;./lib/c3p0-0.9.5.2.jar;./lib/mchange-commons-java-0.2.11.jar;./lib/mysql-connector-java-6.0.6.jar;./lib/ojdbc6-11.2.0.1.0.jar"

echo Begin Start Iyeeku-Watch-Server

java -cp %CLASSPATH% %JAVA_OPTION% %RUN_CLASS%

pause


