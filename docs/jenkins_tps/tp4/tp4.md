Mesure de la qualité de code
Objectif : brancher SonarQube sur le job Maven et analyser le tableau de bord.
1
Démarrer SonarQube : docker run -d -p 9000:9000 sonarqube:community, 
puis générer un token.
2
Installer le plugin « SonarQube Scanner » et déclarer le serveur (Administrer 
→ System).
3
Ajouter l'analyse au build Maven : mvn clean verify sonar:sonar
4
Ajouter le plugin JaCoCo au pom.xml pour la couverture.
5
Analyser : bugs, vulnérabilités, code smells, duplication, couverture ; 
observer le Quality Gate.
