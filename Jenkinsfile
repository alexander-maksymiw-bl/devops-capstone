pipeline {
    agent any
    stages {
        stage('Linting') {
            steps {
                sh 'ng lint'
            }
        }
        stage('Build') {
            steps {
                sh 'ng build --prod'
            }
        }
        stage('Create image') {
            app = docker.build("capstone")
        }
        stage('Push image') {
            docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                app.push("${env.BUILD_NUMBER}")
                app.push("latest")
            }
        }
    }
}