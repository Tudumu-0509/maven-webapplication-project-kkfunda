def call() {
    stage('Deploy to Tomcat') {
        echo "Deploying to Tomcat..."
        sh """
            curl -u sai:password \\
            --upload-file target/maven-web-application.war \\
            "http://54.164.80.148:8080/manager/text/deploy?path=/maven-web-application&update=true"
        """
    }
}

