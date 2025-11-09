def call() {
    stage('Deploy to Tomcat') {
        echo "Deploying to Tomcat..."
        sh """
            curl -u manesha:password \\
            --upload-file target/maven-web-application.war \\
            "http://3.235.1.233:8080/manager/text/deploy?path=/maven-web-application&update=true"
        """
    }
}
