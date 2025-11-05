def call() {
    stage('nexus') {
        echo "Building the application..."
        sh 'mvn deploy'
    }
}
