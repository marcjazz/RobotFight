 Architecture maître/esclave et partage de charge
Objectif : ajouter un agent et répartir l'exécution des builds.
1
Lancer un agent conteneurisé : docker run -d jenkins/ssh-agent (à défaut, 
une VM avec Java).
2
Administrer Jenkins → Nodes → « New Node » : répertoire distant, nombre 
d'executors, label (ex. linux).
3
Connecter l'agent : via SSH ou en lançant la commande JNLP fournie par 
Jenkins.
4
Restreindre un job au label de l'agent (« Restrict where this project can be 
run »).
5
Lancer plusieurs builds simultanés et observer la répartition de charge dans 
la file d'exécution.

Observation attendue
• Les builds s'exécutent en parallèle 
sur les deux nœuds.
• Un job avec label ne s'exécute que 
sur l'agent correspondant.
• Agent hors ligne : le build attend 
dans la file
