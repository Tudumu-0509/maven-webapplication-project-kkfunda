def call() {
    stage('Build') {
        echo "Building the application..."

        // ✅ Correct GitHub URL + credentials
        git branch: 'development',
            credentialsId: 'github-token',
            url: 'https://github.com/Tudumu-0509/maven-webapplication-project-kkfunda.git'

        // Maven build
        sh 'mvn clean package'
    }
}



