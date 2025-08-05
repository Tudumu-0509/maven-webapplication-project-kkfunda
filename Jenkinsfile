pipeline {
    agent any
    tools{
	maven "maven-3.9.9"
	}
    stages {
        stage("gitcheclout") {
            steps {
               git 'https://github.com/Tudumu-0509/maven-webapplication-project-kkfunda.git'
            }
        }
        stage('compile'){
    steps{
     sh "mvn compile"
	}
}
stage('sonar report'){
	steps{
	sh "mvn sonar:sonar"
	}
}
stage ("nexus report"){
steps{
    sh "mvn deploy"
}
}
stage('Deploy to Tomcat') {
            steps {
                sh """
                    curl -u admin:password \\
                    --upload-file /var/lib/jenkins/workspace/declarative-pipeline/target/maven-web-application.war \\
                    "http://18.141.176.172:8080/manager/text/deploy?path=/maven-web-application&update=true"
                """
            }
        }
    }
}
