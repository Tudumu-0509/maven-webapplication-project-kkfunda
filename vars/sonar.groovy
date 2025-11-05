def call() {
    stage('sonar') {
        echo "Building the application..."
        sh 'mvn sonar:sonar'
    }
}
