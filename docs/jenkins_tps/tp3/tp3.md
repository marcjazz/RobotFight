Interconnexion Jenkins – GitHub
Objectif : déclencher automatiquement un build à chaque push sur GitHub.
1
Installer les plugins Git et GitHub.
2
Déclarer un credential : token d'accès personnel GitHub (PAT).
3
Créer un job pointant vers l'URL du dépôt (branche main).
4
Sur GitHub : Settings → Webhooks → http://<jenkins>:8080/github␂webhook/
5
Activer « GitHub hook trigger » dans le job, pousser un commit, vérifier le 
déclenchement.

