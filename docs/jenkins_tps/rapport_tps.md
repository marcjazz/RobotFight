# Rapport des TP DevOps - Jenkins

Ce document consolide les manipulations et résultats des TPs 1 à 4 sur l'intégration continue avec Jenkins, Maven, GitHub et SonarQube.

---

## TP1 : Création et compilation d'un projet Freestyle

**Objectif :** Créer un premier job et compiler une application Java simple.

1. **Création du job** : Configuration d'un projet "Free-style".
2. **Code source** : Récupération depuis le dépôt Git.
3. **Build** : Ajout d'une étape d'exécution de script shell pour compiler.
   ![Étape de build Shell](tp1/build_step_shell.png)
4. **Exécution** : Suivi de la sortie console en direct.
   ![Logs de la console](tp1/console_logs.png)
5. **Résultat** : Analyse de l'historique et du succès du build.
   ![Historique des builds](tp1/build_history.png)
   ![Statut de succès](tp1/build_success.png)

---

## TP2 : Création et compilation d'un projet Maven

**Objectif :** Industrialiser le build avec Maven et publier les résultats de tests.

1. **Configuration globale** : Installation du plugin "Maven Integration" et déclaration de Maven dans les outils globaux.
   ![Configuration globale Maven](tp2/maven_global_config.png)
2. **Création du projet** : Création d'un job de type "Projet Maven".
   ![Création du projet Maven](tp2/project_creation.png)
3. **Configuration du Job** : Lien vers le `pom.xml` et définition des goals (`clean install`).
   ![Configuration du Job](tp2/project_config.png)
4. **Exécution et Tests** :
   - Exemple d'un build échoué (tests en erreur) :
     ![Build en échec](tp2/failed_build.png)
   - Correction et build en succès :
     ![Build en succès](tp2/success_build.png)
     ![Logs du succès](tp2/success_logs.png)
5. **Rapport** : Vérification de la publication des rapports JUnit.
   ![Rapports de test](tp2/test_report.png)

---

## TP3 : Interconnexion Jenkins – GitHub

**Objectif :** Déclencher automatiquement un build à chaque push sur GitHub.

1. **Plugins** : Installation des plugins Git et GitHub.
   ![Plugins installés](tp3/plugins_installed.png)
2. **Credentials et SCM** : Configuration du dépôt GitHub dans le Job (branche master).
   ![Configuration SCM](tp3/scm_config.png)
3. **Exposition Jenkins** : Mise à jour de l'URL Jenkins (via ngrok) pour être accessible par GitHub.
   ![Mise à jour de l'URL Jenkins](tp3/jenkins_url.png)
4. **Webhooks GitHub** : Configuration du Webhook côté GitHub et Jenkins.
   ![Configuration Webhook GitHub](tp3/github_webhook_config.png)
5. **Déclencheur (Trigger)** : Activation du trigger "GitHub hook trigger for GITScm polling".
   ![Configuration du trigger](tp3/job_trigger.png)
6. **Résultat** : Un push déclenche automatiquement un build avec succès.
   ![Build déclenché par le hook](tp3/webhook_build.png)

---

## TP4 : Mesure de la qualité de code avec SonarQube

**Objectif :** Brancher SonarQube sur le job Maven et analyser le tableau de bord.

1. **SonarQube** : Démarrage de SonarQube via Docker et génération d'un token d'accès.
   ![Génération du Token SonarQube](tp4/sonar_token.png)
2. **Configuration Jenkins** : Installation du plugin "SonarQube Scanner" et déclaration du serveur dans la configuration globale.
   ![Installation Sonar Scanner](tp4/sonar_scanner_plugin.png)
   ![Configuration Serveur Sonar](tp4/jenkins_sonar_server.png)
3. **JaCoCo** : Ajout du plugin JaCoCo au `pom.xml` pour mesurer la couverture de code.
```xml
<plugin>
    <groupId>org.jacoco</groupId>
    <artifactId>jacoco-maven-plugin</artifactId>
    <version>0.8.11</version>
    <executions>
        <execution>
            <goals><goal>prepare-agent</goal></goals>
        </execution>
        <execution>
            <id>report</id>
            <phase>verify</phase>
            <goals><goal>report</goal></goals>
        </execution>
    </executions>
</plugin>
```
4. **Job Maven** : Ajout des goals `sonar:sonar` et activation de l'environnement SonarQube.
   ![Activation Sonar dans le Job](tp4/job_sonar_activation.png)
   ![Ajout des goals Sonar](tp4/maven_goals.png)
5. **Analyse et Résultats** : Rapport de qualité (Quality Gate, Bugs, Vulnérabilités, Couverture) disponible sur le Dashboard SonarQube et lié dans Jenkins.
   ![Lien du Rapport dans Jenkins](tp4/quality_report.png)
   ![Dashboard SonarQube](tp4/sonarqube_dashboard.png)

---

## TP5 : Création de builds avec paramètres en entrée

**Objectif :** Piloter le comportement d'un job selon des paramètres saisis au lancement.

### Partie 1 : Paramètres basiques
1. **Configuration du job** : Cocher la case « Ce projet est paramétré ».
   ![Ajout de paramètres](tp5/adding_parameters.png)
2. **Paramètres Choice et String** :
   - Ajout d'un paramètre Choice `ENVIRONNEMENT` (valeurs : dev, recette, prod).
   - Ajout d'un paramètre String `VERSION` (valeur par défaut : 1.0.0).
3. **Utilisation des variables** : Intégration de `$ENVIRONNEMENT` et `$VERSION` dans les étapes de build (ex: echo, nom d'artefact).
   ![Ajout d'une commande de preuve](tp5/add_command_proof.png)
4. **Exécution** : Lancement via « Build with Parameters » et vérification des valeurs dans la console.
   ![Lancement avec paramètres](tp5/start_build_parameters.png)
   ![Preuve d'injection des paramètres](tp5/proof_parameter_success.png)

### Partie 2 : Pour aller plus loin
1. **Active Choices (Listes dynamiques dépendantes)** :
   - Installation du plugin **Active Choices**.
   - Création d'un paramètre maître et d'un paramètre dépendant (**Active Choices Reactive Parameter**).
   - Utilisation d'un script Groovy pour adapter le contenu de la seconde liste en fonction de la sélection de la première (ex: liste des serveurs qui change selon l'environnement).
   ![Utilisation d'Active Choice](tp5/using_active_choice_version.png)
   ![Active Choice Paramétré 1](tp5/active_choice_params_1.png)
   ![Active Choice Paramétré 2](tp5/active_choice_params_2.png)
2. **Déclenchement paramétré d'un job aval** :
   - Installation du plugin **Parameterized Trigger**.
   - Configuration d'une étape post-build dans le Job A (Amont) pour appeler le Job B (Aval).
   - Transmission des paramètres (ex: Current build parameters ou Predefined parameters) du Job A vers le Job B pour assurer la continuité du pipeline.

---

## TP6 : Déploiement automatique sur Tomcat

**Objectif :** Déployer un WAR sur Tomcat à chaque build réussi.

1. **Préparation Tomcat** :
   - Lancement de Tomcat en conteneur Docker (port 8081).
   - Création d'un fichier `tomcat-users.xml` pour activer le rôle `manager-script` (ou utilisation du `Dockerfile` personnalisé).
   - *Note technique* : Résolution de l'erreur 404 en restaurant les webapps par défaut de l'image Tomcat 9.0 et en autorisant les connexions distantes pour Jenkins.
2. **Configuration Jenkins** :
   - Installation du plugin **Deploy to container**.
   - Ajout des identifiants (Credentials) de déploiement pour Tomcat.
   ![Configuration Credentials Tomcat](tp6/tomcat_credentials.png)
3. **Adaptation du Projet (RobotFight)** :
   - Transformation du projet Java Standard (`.jar`) en application Web (`.war`) via le `pom.xml`.
   - Création d'une page d'accueil (Landing Page) HTML moderne et responsive (`index.jsp`).
4. **Analyse SonarQube** :
   - Détection d'un *Code Smell* HTML (balises `<!DOCTYPE>` et `lang` manquantes) bloquant le Quality Gate.
   ![Erreur SonarQube HTML](tp6/sonarqube_html_error.png)
   - Correction du code, validation complète au build suivant.
   ![Succès SonarQube](tp6/sonarqube_success.png)
5. **Déploiement Automatisé** :
   - Ajout de l'action post-build "Deploy war/ear to a container" pointant sur l'URL de Tomcat.
   ![Configuration du Job de Déploiement](tp6/deploy_job_config.png)
   - Vérification du succès du déploiement dans la console Jenkins.
   ![Succès du Déploiement Jenkins](tp6/deploy_war_success.png)
6. **Résultat Final** :
   - L'application Web est accessible publiquement, prouvant le fonctionnement complet de la chaîne CI/CD !
   ![Application Web RobotFight en ligne](tp6/robot_fight_web_app.png)

---

## TP7 : Création de projets avec Jenkins DSL (Pipeline as Code)

**Objectif :** Écrire un pipeline déclaratif puis le versionner dans GitHub.

1. **Création du job** : Création d'un nouveau job de type « Pipeline ».
2. **Jenkinsfile (Pipeline as Code)** : 
   - Écriture d'un pipeline déclaratif définissant les étapes d'intégration continue (Checkout, Build, Test, SonarQube).
   - Versionnement de ce script dans un fichier `Jenkinsfile` à la racine du dépôt GitHub.

```groovy
pipeline {
    agent any

    tools {
        maven 'Maven3'
    }

    stages {
        stage('Checkout') {
            steps {
                echo '📥 Récupération du code source...'
                checkout scm
            }
        }
        stage('Build') {
            steps {
                echo '⚙️ Compilation du projet...'
                sh 'mvn clean compile'
            }
        }
        stage('Test') {
            steps {
                echo '🧪 Exécution des tests unitaires...'
                sh 'mvn test'
            }
        }
        stage('Quality & Package') {
            steps {
                echo '📦 Packaging et analyse SonarQube...'
                withSonarQubeEnv('SonarQubeLocal') {
                    sh 'mvn package sonar:sonar'
                }
            }
        }
    }
}
```

3. **Configuration SCM** : 
   - Configuration du Job pour lire le pipeline directement depuis GitHub via l'option **Pipeline script from SCM** (Dépôt + Branche).
4. **Exécution et Suivi** : 
   - Au lancement (ou via Webhook), Jenkins récupère le `Jenkinsfile` sur GitHub et exécute les stages.
   - Observation intuitive de la progression via la vue **Stage View**.

---

## TP8 : Architecture maître/esclave et partage de charge

**Objectif :** Ajouter un agent externe (Nœud) et répartir l'exécution des builds pour soulager le maître.

1. **Préparation de l'Agent** : 
   - Génération d'une paire de clés SSH dédiée.
   - Lancement d'un conteneur Docker `jenkins/ssh-agent` (sur le port 2222) avec la clé publique autorisée.
2. **Configuration dans Jenkins** :
   - Ajout de la clé SSH privée dans le gestionnaire d'identifiants (Credentials).
   - Création d'un nouveau Nœud (Node) nommé `docker-agent` dans Jenkins.
   ![Création du Nœud](tp8/node_creation.png)
   - Configuration SSH (IP de la passerelle Docker, port 2222, identifiants) et affectation du label `linux`.
   ![Configuration du Nœud](tp8/node_config.png)
   - Connexion réussie : le nœud apparaît "En ligne" et prêt à travailler.
   ![Liste des Nœuds](tp8/node_list.png)
3. **Modification du Pipeline** :
   - Mise à jour du `Jenkinsfile` pour exiger que le build tourne sur un agent spécifique (via le label) :
     ```groovy
     pipeline {
         agent { label 'linux' }
         // ... suite du pipeline
     }
     ```
4. **Répartition de charge (Load Balancing)** :
   - Lancement de plusieurs builds simultanés pour tester la montée en charge.
   - Observation dans la file d'attente (Build Queue) : Jenkins (Master) délègue l'exécution à l'agent `docker-agent`. Les builds s'empilent si l'agent est déjà occupé.
   ![Exécuteur occupé](tp8/agent_executor_busy.png)

---

## TP9 : Sécurité, sauvegarde et restauration (Disaster Recovery)

**Objectif :** Sécuriser l'instance et garantir sa remise en service après un incident critique.

### 1. Sécuriser Jenkins (Autorisation par matrice)
1. **Activation de la sécurité** : Utilisation de la base de données interne de Jenkins et de la stratégie d'autorisation par matrice (*Matrix-based security*).
2. **Création des rôles** : 
   - Création de comptes distincts : Administrateur, Développeur, et Lecteur.
   ![Création des utilisateurs](tp9/admin_user_creation.png)
3. **Attribution des droits** : 
   - Restrictions appliquées selon le principe de moindre privilège (ex: le lecteur n'a que des droits de lecture sur les Jobs).
   ![Matrice des rôles](tp9/role_matrix.png)
   - Vérification en condition réelle : le compte "Lecteur" ne voit ni les configurations, ni l'administration du serveur.
   ![Accès limité du lecteur](tp9/reader_limited_access.png)

### 2. Sauvegarde de l'Infrastructure (Backup)
1. **Stratégie Docker** : Au lieu d'utiliser un plugin interne (ThinBackup), la sauvegarde est réalisée directement au niveau de l'infrastructure Docker en archivant le volume `jenkins_home`.
2. **Exécution du Backup** : 
   - Utilisation d'un conteneur temporaire pour compresser le volume actif dans une archive `.tar`.
   ```bash
   docker run --rm --volumes-from jenkins -v $(pwd):/backup ubuntu tar cvf /backup/jenkins_backup_complet.tar /var/jenkins_home
   ```
   ![Sauvegarde du Volume](tp9/docker_volume_backup.png)

### 3. Simulation de Crash et Restauration
1. **Destruction du serveur** : 
   - Suppression du conteneur Jenkins et suppression définitive du volume de données `jenkins_home` pour simuler une perte totale.
   ![Simulation de Crash](tp9/docker_crash_simulation.png)
2. **Restauration (Disaster Recovery)** : 
   - Création d'un volume vierge et extraction de l'archive `.tar` à l'intérieur.
   ![Restauration du Volume](tp9/docker_volume_restore.png)
   - Lancement d'un nouveau conteneur Jenkins branché sur le volume restauré.
3. **Validation** : 
   - Vérification que l'intégralité des Jobs, des plugins et des configurations de sécurité ont été restaurés avec succès, prouvant la robustesse de la méthode !
   ![Tout est restauré](tp9/everything_restored.png)
