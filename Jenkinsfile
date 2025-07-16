pipeline {
    agent any

    parameters {
        string(name: 'GIT_BRANCH', defaultValue: 'development', description: 'Git Branch to build')
        string(name: 'DEPLOY_PATH', defaultValue: '/maven-web-application', description: 'Tomcat context path')
        string(name: 'TOMCAT_URL', defaultValue: 'http://13.232.112.37:8080/', description: 'Tomcat server URL')
    }

    tools {
        maven "maven-3.9.9"
    }

    environment {
        WAR_FILE = 'target/maven-web-application.war'
    }

    triggers {
        githubPush() // optional, only triggers automatically on GitHub push
    }

    stages {
        stage('Git Checkout') {
            steps {
                git credentialsId: 'GIT_CRED_ID', branch: params.GIT_BRANCH, url: 'https://github.com/Tudumu-0509/maven-webapplication-project-kkfunda.git'
            }
        }

        stage('Compile') {
            steps {
                sh 'mvn clean compile'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn package'
            }
        }

        stage('SonarQube Report') {
            steps {
                sh 'mvn sonar:sonar'
            }
        }

        stage('Deploy to Nexus') {
            steps {
                sh 'mvn deploy'
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: '56c0448d-7887-4bcd-ad05-36a0755549fe', 
                        usernameVariable: 'TOMCAT_USER', 
                        passwordVariable: 'TOMCAT_PASS'
                    )
                ]) {
                    sh """
                        curl -u $TOMCAT_USER:$TOMCAT_PASS \
                        --upload-file ${env.WAR_FILE} \
                        "${params.TOMCAT_URL}/manager/text/deploy?path=${params.DEPLOY_PATH}&update=true"
                    """
                }
            }
        }
    }

    post {
        success {
            script {
                def colorCode = '#00FF00'
                def subject = "SUCCESS: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'"
                def summary = "${subject} (${env.BUILD_URL})"
                slackSend(color: colorCode, message: summary)
            }
        }

        failure {
            script {
                def colorCode = '#FF0000'
                def subject = "FAILURE: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'"
                def summary = "${subject} (${env.BUILD_URL})"
                slackSend(color: colorCode, message: summary)
            }
        }
    }
}
