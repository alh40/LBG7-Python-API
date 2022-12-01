pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh '''
                docker build -t gcr.io/lbg/pythonapp:latest -t gcr.io/lbg/pythonapp:$BUILD_NUMBER .
                docker push gcr.io/lbg/pythonapp:latest
                docker push gcr.io/lbg/pythonapp:$BUILD_NUMBER
                '''
            }
        }
        stage('Deploy') {
            steps {
                sh '''
                kubectl apply -f ./kubernetes/application.yml
                kubectl apply -f ./kubernetes/service.yml
                kubectl rollout restart deployment pythonapp
                kubectl rollout restart deployment nginx
                '''
            }
        }
    }
}