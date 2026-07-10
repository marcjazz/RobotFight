 Déploiement automatique sur Tomcat
Objectif : déployer un WAR sur Tomcat à chaque build réussi.
1
Lancer Tomcat en conteneur (port 8081) et activer le manager : rôle 
manager-script dans tomcat-users.xml.
2
Installer le plugin « Deploy to container » dans Jenkins.
3
Job Maven : packaging WAR (goals clean package).
4
Action post-build « Deploy war/ear to a container » : chemin du WAR, URL 
Tomcat, credentials.
5
Vérifier l'application dans le navigateur, puis pousser un commit : build + 
redéploiement automatiques.

Points de vigilance
• URL vue de Jenkins : nom du 
conteneur 
(http://tomcat:8080/manager), pas 
localhost.
• Ne jamais coder les mots de passe 
en dur : credentials Jenkins.
• En échec de tests, le déploiement 
ne doit pas avoir lieu.
