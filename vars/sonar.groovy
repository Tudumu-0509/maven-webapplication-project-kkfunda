def call(){
stage('sonar report'){
	steps{
	sh "mvn sonar:sonar"
	}
}
}


