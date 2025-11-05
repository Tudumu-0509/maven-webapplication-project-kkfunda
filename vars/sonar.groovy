// vars/sonarBuild.groovy
def call() {
    echo "Running SonarQube Analysis..."
    withCredentials([string(credentialsId: 'SONAR_TOKEN_ID', variable: 'SONAR_TOKEN')]) {
        sh "mvn sonar:sonar -Dsonar.login=${SONAR_TOKEN}"
    }
}
