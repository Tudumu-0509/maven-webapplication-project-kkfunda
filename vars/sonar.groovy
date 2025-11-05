def call() {
    echo "Running SonarQube Analysis..."
    withSonarQubeEnv('MySonarQube') {
        withCredentials([string(credentialsId: 'SONAR_TOKEN_ID', variable: 'SONAR_TOKEN')]) {
            dir('maven-webapplication-project-kkfunda') {
                sh "mvn sonar:sonar -Dsonar.login=${SONAR_TOKEN}"
            }
        }
    }
}


