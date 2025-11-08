def call() {
   stage('sonar){
    echo "Running SonarQube analysis..."
    sh 'mvn sonar:sonar'
}
         }




