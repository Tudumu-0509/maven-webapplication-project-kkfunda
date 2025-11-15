pipeline {
    agent any

    environment {
         TERRAFORM_DIR = "terraform"
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

        stage('Get EC2 Public IP') {
            steps {
                script {
                    dir("${TERRAFORM_DIR}") {
                        def ec2_ip = sh(script: "terraform output -raw ec2_public_ip", returnStdout: true).trim()
                        env.HOST = ec2_ip
                        echo "✅ EC2 Public IP: ${ec2_ip}"
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
