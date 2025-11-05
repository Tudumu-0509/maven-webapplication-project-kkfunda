def call() {
    stage('Git Checkout') {
        // use 'script' level step directly
        checkout([$class: 'GitSCM',
            branches: [[name: '*/master']],
            userRemoteConfigs: [[url: 'https://github.com/Tudumu-0509/maven-webapplication-project-kkfunda.git']]
        ])
    }
}
