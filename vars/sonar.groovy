// vars/sonar.groovy
def call() {
	stage('soanr')
    // Run the SonarQube scan
    sh "mvn sonar:sonar"
}
