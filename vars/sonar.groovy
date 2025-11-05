def call(String projectKey, String sonarHostUrl) {
    // Use Jenkins credentials securely
    withCredentials([string(credentialsId: 'SONAR_TOKEN', variable: 'SONAR_TOKEN')]) {
        sh """
            mvn clean install sonar:sonar \
            -Dsonar.projectKey=${projectKey} \
            -Dsonar.host.url=${sonarHostUrl} \
            -Dsonar.login=$SONAR_TOKEN
        """
    }
}





