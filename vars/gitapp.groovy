def call() {
    stage('Build') {
        echo "Building the application..."

        // Step 1: Clone the Git repository
        git branch: 'development', url: 'https://github.com/kkfunda/maven-webapplication-project-kkfunda.git'

        // Step 2: Build the Maven project
        sh 'mvn clean package'
    }
}

