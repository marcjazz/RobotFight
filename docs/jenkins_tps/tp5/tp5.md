Création de builds avec paramètres en entrée
Objectif : piloter le comportement d'un job selon des paramètres saisis au 
lancement.
1
Dans la configuration du job, cocher « Ce build a des paramètres ».
2
Ajouter un paramètre Choice ENVIRONNEMENT : dev / recette / prod.
3
Ajouter un paramètre String VERSION (valeur par défaut : 1.0.0).
4
Utiliser $ENVIRONNEMENT et $VERSION dans les étapes de build (echo, 
nom d'artefact...).
5
Lancer via « Build with Parameters » et vérifier les valeurs dans la console.

Pour aller plus loin
• Paramètre « Active Choices » : listes 
dynamiques dépendantes.
• Déclenchement paramétré d'un job 
aval (plugin Parameterized Trigger).
