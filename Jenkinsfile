pipeline {
    agent any
    stages {
        stage('Install dependencies') {
            steps {
                sh 'npm install'
            }
        }
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
            when {
                branch 'master'
            }
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                        def app = docker.build("maksimum/capstone:${env.BUILD_NUMBER}")
                        app.push("latest")
                    }
                }
            }
        }
        stage('Update kubernetes cluster') {
            when {
                branch 'master'
            }
            steps {
                sh "kubectl set image deployment/maks-capstone capstone=docker.io/maksimum/capstone:${env.BUILD_NUMBER}"
            }
        }
    }
}