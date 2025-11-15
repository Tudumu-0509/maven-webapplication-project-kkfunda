pipeline {
    agent any

    environment {
        TERRAFORM_DIR = "terraform1"
        AWS_DEFAULT_REGION = "us-east-1"
    }

    stages {
        stage('Checkout Git Repo') {
            steps {
                git branch: 'master', url: 'https://github.com/Tudumu-0509/maven-webapplication-project-kkfunda.git'
            }
        }

        stage('Terraform Init & Apply') {
            steps {
                dir("${TERRAFORM_DIR}") {
                    withCredentials([[ 
                        $class: 'AmazonWebServicesCredentialsBinding',
                        credentialsId: 'aws-cred'
                    ]]) {
                        sh 'terraform init'
                        sh 'terraform apply -auto-approve'
                    }
                }
            }
        }
    }

    post {
        success {
            echo "🎉 Application successfully deployed!"
        }
        failure {
            echo "❌ Deployment failed!"
        }
    }
}
