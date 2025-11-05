def call() {
    echo "Running SonarQube Analysis..."
    withSonarQubeEnv('MySonarQube') { // 'MySonarQube' is Jenkins SonarQube Server Name
        sh "mvn clean verify sonar:sonar -Dsonar.login=${SONAR_TOKEN}"
    }
}
