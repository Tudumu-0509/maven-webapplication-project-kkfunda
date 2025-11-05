// vars/sonar.groovy
def call() {
stage('sonar report'){
	steps{
	sh "mvn sonar:sonar"
	}
}



