def call() {
    stage('sonar') {
        echo "Building the application..."
        withCredentials([string(credentialsId: 'sonarqube-token', variable: 'SONAR_TOKEN')]) {
            sh 'mvn sonar:sonar -Dsonar.login=$SONAR_TOKEN'
        }
    }
}


