 Sécurité, sauvegarde et restauration
Objectif : sécuriser l'instance et garantir sa remise en service après incident.
1
Activer la sécurité : base d'utilisateurs Jenkins + autorisation par matrice.
2
Créer des comptes aux rôles distincts : administrateur, développeur, lecteur ; 
vérifier les restrictions.
3
Installer le plugin ThinBackup (ou script de sauvegarde de $JENKINS_HOME).
4
Planifier une sauvegarde complète : configuration, jobs, plugins, credentials.
5
Simuler une perte, restaurer la sauvegarde et vérifier l'intégrité de

Bonnes pratiques
• En Docker, JENKINS_HOME vit dans 
le volume jenkins_home : c'est lui 
qu'il faut archiver.
• Sauvegarde externalisée (hors du 
serveur Jenkins).
• Tester régulièrement la procédure 
de restauration. 
