def call(){
stage('Git Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/Tudumu-0509/maven-webapplication-project-kkfunda.git'
            }
        }
}
