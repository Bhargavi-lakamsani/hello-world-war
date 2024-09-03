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
                 sh '''
                DEPLOY_DIR="/var/lib/tomcat/webapps/"
                cp target/*.war $DEPLOY_DIR
                sudo systemctl restart tomcat
                '''
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
