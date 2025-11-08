// vars/sonarBuild.groovy
def call() {
    echo "Running SonarQube analysis..."
    sh 'mvn sonar:sonar'
}





