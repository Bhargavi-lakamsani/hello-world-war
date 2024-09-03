pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
        
                git branch: 'master', credentialsId: 'github', url: 'https://github.com/Bhargavi-lakamsani/hello-world-war.git'
            }
        }

        stage('Build') {
            steps {
                
                sh 'mvn clean package'
            }
        }

        stage('Test') {
            steps {
                
                sh 'mvn test'
            }
        }

        stage('Deploy') {
            steps {
                
                sh 'sudo cp /var/lib/jenkins/workspace/web-application/target/*.war /opt/tomcat/webapps/'
            }
        }
    }
    
    post {
        success {
            echo 'Pipeline completed successfully.'
            
        }
        failure {
            echo 'Pipeline failed.'
            
        }
    }
}
