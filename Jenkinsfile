pipeline {
    agent any

    environment {
        TERRAFORM_DIR = "terraform"
        IMAGE_NAME = "docker.io/ganeshtudumu/maven-web-app:1.0.0"
        CONTAINER_NAME = "myapp-container"
        PORT = "8080"
        USER = "ec2-user"
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

       stage('Deploy Container on Amazon Linux 2 with Docker') {
    steps {
        withCredentials([
            sshUserPrivateKey(credentialsId: 'ec2-ssh-key', keyFileVariable: 'SSH_KEY', usernameVariable: 'SSH_USER'),
            usernamePassword(credentialsId: 'docker-cred', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')
        ]) {
            sh """
                ssh -o StrictHostKeyChecking=no -i \$SSH_KEY \$USER@\$HOST 'bash -s' <<'ENDSSH'
                    set -e
                    echo "🔧 Installing Docker..."
                    sudo amazon-linux-extras enable docker
                    sudo yum install -y docker
                    sudo systemctl enable --now docker
                    sudo usermod -aG docker $USER

                    echo "🔐 Logging in to Docker Hub..."
                    echo \$DOCKER_PASS | sudo docker login -u \$DOCKER_USER --password-stdin

                    echo "🧹 Cleaning old container..."
                    sudo docker ps -a -q --filter "name=${CONTAINER_NAME}" | grep . && sudo docker rm -f ${CONTAINER_NAME} || true

                    echo "⬇️ Pulling latest image..."
                    sudo docker pull ${IMAGE_NAME}

                    echo "🚀 Running new container..."
                    sudo docker run -d -p ${PORT}:8080 --name ${CONTAINER_NAME} ${IMAGE_NAME}

                    echo "✅ Deployment complete!"
ENDSSH
            """
        }
    }
}

    post {
        success {
            echo "🎉 Application successfully deployed with Docker!"
            echo "🌐 Access it at: http://${HOST}:${PORT}/"
        }
        failure {
            echo "❌ Deployment failed!"
        }
    }
}

