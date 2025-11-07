// Jenkinsfile
pipeline {
    agent any

    tools {
        maven "maven-3.9.9"
    }

    stages {

        stage("Git Checkout") {
            steps {
                git branch: 'master', url: 'https://github.com/Tudumu-0509/maven-webapplication-project-kkfunda.git'
            }
        }

        stage("Compile") {
            steps {
                sh "mvn compile"
            }
        }

        stage("Sonar Report") {
            steps {
                // Optional: use credentials for SonarQube if needed
                sh "mvn sonar:sonar"
            }
        }

        stage("Nexus Deploy") {
            steps {
                sh "mvn deploy"
            }
        }

        stage("Deploy to Tomcat") {
            steps {
                sh """
                    curl -u manesha:password \\
                    --upload-file \${WORKSPACE}/target/maven-web-application.war \\
                    "http://44.200.154.3:8080/manager/text/deploy?path=/maven-web-application&update=true"
                """
            }
        }
    }

    post {
        always {
            echo "Pipeline finished. Check Sonar, Nexus, and Tomcat status."
        }
        success {
            echo "Pipeline completed successfully!"
        }
        failure {
            echo "Pipeline failed. Please check the logs."
        }
    }
}
