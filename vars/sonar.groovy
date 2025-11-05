def call() {
    echo "Running SonarQube Analysis..."

    withSonarQubeEnv('MySonarQube') {
        withCredentials([string(credentialsId: 'SONAR_TOKEN_ID', variable: 'SONAR_TOKEN')]) {
            sh '''
                mvn sonar:sonar \
                -Dsonar.projectKey=maven-web-application-kkfunda \
                -Dsonar.host.url=http://3.236.159.117/:9000 \
                -Dsonar.login=$SONAR_TOKEN
            '''
        }
    }
}




