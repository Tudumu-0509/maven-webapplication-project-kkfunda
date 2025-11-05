def call() {
    stage('Build') {
        echo "Building the application..."

        // Clone using credentials
        git branch: 'development',
            credentialsId: 'github-token',
            url: 'https://github.com/kkfunda/maven-webapplication-project-kkfunda.git'

        // Build the Maven project
        sh 'mvn clean package'
    }
}


