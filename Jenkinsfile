pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh '''
                docker build -t grc.io/lgbapp/pythonapp
                docker push gcr.io/lbgapp/pythonapp
                '''
            }
        }
        stage('Deploy') {
            steps {
                sh '''
                kubectl apply -f ./kubernetes/application.yml
                kubectl apply -f ./kubernetes/nginx.yml
                kubectl rollout restart deployment pythonapp
                kubectl rollout restart deployment nginx
                '''
            }
        }
    }
}