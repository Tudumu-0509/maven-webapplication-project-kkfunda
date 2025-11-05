// vars/sonar.groovy
def call() {
    stage('SonarQube Report') {
        echo "🔍 Running SonarQube analysis..."
        sh "mvn sonar:sonar -Dsonar.login=${env.SONAR_TOKEN}"
    }
}



