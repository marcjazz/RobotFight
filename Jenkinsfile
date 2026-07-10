pipeline {
    agent any

    // Remarque : Si la commande 'mvn' n'est pas reconnue, il faudra décommenter
    // le bloc 'tools' ci-dessous et utiliser le nom donné à Maven dans "Global Tool Configuration"
    // tools {
    //     maven 'M3' 
    // }

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
                echo '📦 Packaging du WAR et analyse SonarQube...'
                // On utilise le même environnement SonarQube que dans le TP4
                withSonarQubeEnv('SonarQubeLocal') {
                    sh 'mvn package sonar:sonar'
                }
            }
        }
    }

    post {
        success {
            echo '✅ Le pipeline s\'est terminé avec succès !'
        }
        failure {
            echo '❌ Le pipeline a échoué. Vérifiez les logs.'
        }
    }
}
