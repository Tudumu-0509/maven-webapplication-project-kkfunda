def call() {
    stage('SonarQube Analysis') {
        echo "🔍 Running SonarQube analysis..."
        withCredentials([string(credentialsId: 'sonarqube-token', variable: 'SONAR_TOKEN')]) {
            withSonarQubeEnv('MySonarServer') {
                sh """
                    mvn clean verify sonar:sonar \
                      -Dsonar.login=${SONAR_TOKEN}
                """
            }
        }
    }
}



