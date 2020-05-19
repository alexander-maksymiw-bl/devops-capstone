pipeline {
    agent any
    stages {
        stage('Linting') {
            steps {
                sh 'ng lint'
            }
        }
        stage('Build Angular app') {
            steps {
                sh 'ng build --prod'
            }
        }
        stage('Build and push image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                        def app = docker.build("capstone")
                        app.push("${env.BUILD_NUMBER}")
                        app.push("latest")
                    }
                }
            }
        }
    }
}