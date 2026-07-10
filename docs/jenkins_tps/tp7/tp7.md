 Création de projets avec Jenkins DSL
Objectif : écrire un pipeline déclaratif puis le versionner dans GitHub.
1
Créer un job de type « Pipeline ».
2
Écrire un pipeline déclaratif dans l'éditeur : stages Build et Test du projet 
Maven.
3
Déplacer le script dans un fichier Jenkinsfile à la racine du dépôt GitHub.
4
Reconfigurer le job : « Pipeline script from SCM » (dépôt + branche).
5
Modifier le Jenkinsfile, pousser, et observer la prise en compte automatique 
(Stage View).

Aides
• Générateur de syntaxe intégré : 
<jenkins>/pipeline-syntax.
• Valider la syntaxe avant commit 
(linter).
• Bonus : transformer le job en 
Multibranch Pipeline.
