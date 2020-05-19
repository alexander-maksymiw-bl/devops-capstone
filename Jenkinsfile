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
                        def app = docker.build("maksimum/capstone")
                        app.push("${env.BUILD_NUMBER}")
                        app.push("latest")
                    }
                }
            }
        }
        // deploy kubernetes cluster if not running yet
        stage('Deploy kubernetes cluster') {
            when {
                allOf {
                    branch 'master'
                    expression {
                        sh(script: 'kubectl get deployments | grep maks-capstone', returnStatus: true) == 1
                    }
                }
            }
            steps {
                sh 'kubectl apply -f kubernetes/capstone-deployment.yaml'
                sh 'kubectl expose deployment maks-capstone --type=LoadBalancer --name maks-capstone --port 80'
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