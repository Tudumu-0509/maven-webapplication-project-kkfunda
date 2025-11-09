def call(Map config = [:]) {

    stage('Deploy to Tomcat') {
        // Default values (you can override if needed)
        def user = config.user ?: "manesha"
        def password = config.password ?: "password"
        def warFile = config.war ?: "target/maven-web-application.war"
        def tomcatUrl = config.tomcatUrl ?: "http://3.238.142.178:8080/manager/text/deploy?path=/maven-web-application&update=true"

        echo "🚀 Deploying ${warFile} to Tomcat..."
        echo "Tomcat URL: ${tomcatUrl}"

        // Run curl deployment
        sh """
            curl -u ${user}:${password} \
            --upload-file ${warFile} \
            "${tomcatUrl}"
        """
        
        echo "✅ Deployment completed successfully!"
    }
}


