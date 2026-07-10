FROM tomcat:9.0

# 1. Copier les applications par défaut (dont le Manager) dans le répertoire webapps actif
RUN cp -R /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps/

# 2. Remplacer le context.xml du manager pour désactiver la restriction IP et autoriser Jenkins
RUN echo '<Context antiResourceLocking="false" privileged="true" />' > /usr/local/tomcat/webapps/manager/META-INF/context.xml

# 3. Injecter les credentials Tomcat directement dans l'image
COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
