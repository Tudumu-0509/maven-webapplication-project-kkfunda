def call() {
    echo "Running SonarQube Analysis..."
    withSonarQubeEnv('MySonarQube') { // Jenkinsలో configure చేసిన SonarQube server పేరు
        withCredentials([string(credentialsId: 'SONAR_TOKEN_ID', variable: 'SONAR_TOKEN')]) {
            sh "mvn sonar:sonar -Dsonar.login=${SONAR_TOKEN}"
        }
    }
}

