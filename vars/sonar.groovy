def call() {
    stage('SonarQube Analysis') {
        echo "Running SonarQube scan..."

        withCredentials([string(credentialsId: 'sonar-token', variable: 'SONAR_TOKEN')]) {
            sh """
                mvn sonar:sonar \
                -Dsonar.host.url=http://<your-sonarqube-server-ip>:9000 \
                -Dsonar.login=$SONAR_TOKEN
            """
        }
    }
}

