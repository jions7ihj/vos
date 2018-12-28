chown -R tomcat7:tomcat7 /var/lib/tomcat7/ && chmod 777 /var/lib/tomcat7
su - tomcat7 -c "/usr/local/freeswitch/bin/freeswitch -ncwait -nonat"