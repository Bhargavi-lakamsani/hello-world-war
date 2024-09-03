pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Pull code from the Git repository
                git branch: 'master', credentialsId: 'github', url: 'https://github.com/Bhargavi-lakamsani/hello-world-war.git'
            }
        }

        stage('Build') {
            steps {
                // Build the application
                sh 'mvn clean package'
            }
        }

        stage('Test') {
            steps {
                // Run automated tests
                sh 'mvn test'
            }
        }

        stage('Deploy') {
            steps {
                // Deploy the WAR file to Tomcat's webapps directory
                sh 'cp sudo /var/lib/jenkins/workspace/web-application/target/hello-world-war-1.0.0.war /opt/tomcat/webapps/'

                // Restart Tomcat to deploy the new application
                sh '/opt/tomcat/bin/shutdown.sh'
                sh '/opt/tomcat/bin/startup.sh'
            }
        }
    }
}
