pipeline {
    agent any

    environment {
        TERRAFORM_DIR = "terraform"
        IMAGE_NAME = "docker.io/ganeshtudumu/maven-web-app:1.0.0"
        CONTAINER_NAME = "myapp-container"
        PORT = "8080"
        USER = "ubuntu"
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

        stage('Wait for SSH Availability') {
            steps {
                script {
                    echo "⏳ Waiting for SSH on ${HOST}..."
                    retry(10) {
                        sh "nc -zv ${HOST} 22"
                        sleep 5
                    }
                    echo "✅ SSH is ready!"
                }
            }
        }

        stage('Deploy Container on Ubuntu with Docker') {
            steps {
                withCredentials([
                    sshUserPrivateKey(credentialsId: 'ec2-ssh-key', keyFileVariable: 'SSH_KEY', usernameVariable: 'SSH_USER'),
                    usernamePassword(credentialsId: 'docker-cred', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')
                ]) {
                    sh """
                        ssh -o StrictHostKeyChecking=no -i \$SSH_KEY \$USER@\$HOST "DOCKER_USER='\$DOCKER_USER' DOCKER_PASS='\$DOCKER_PASS' bash -s" <<'ENDSSH'
                            set -e
                            set -o pipefail

                            echo "🔧 Updating packages..."
                            sudo apt-get update -y
                            sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common gnupg lsb-release

                            echo "🔧 Installing Docker..."
                            curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
                            echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
                            sudo apt-get update -y
                            sudo apt-get install -y docker-ce docker-ce-cli containerd.io
                            sudo systemctl enable --now docker

                            echo "🔐 Logging in to Docker Hub..."
                            echo "\$DOCKER_PASS" | sudo docker login -u "\$DOCKER_USER" --password-stdin

                            echo "🧹 Cleaning old container..."
                            sudo docker rm -f ${CONTAINER_NAME} || true

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
    }

    post {
        success {
            echo "🎉 Application successfully deployed!"
            echo "🌐 Access it at: http://${HOST}:${PORT}/"
        }
        failure {
            echo "❌ Deployment failed!"
        }
    }
}
