pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh '''
                docker-compose build
                '''
            }
        }
        stage('Push') {
            steps {
                
                withDockerRegistry([ credentialsId: "dockerhub", url: ""]){
                    sh "docker-compose push"
                }      
                
            }
        }
        stage('Deploy') {
            steps {
                sh '''
                rm -rf LBG7-Python-API
                git clone git@github.com:alh40/LBG7-Python-API.git
                cd LBG7-Python-API
                docker-compose down
                docker-compose up -d
                '''
            }
        }
        stage('Clean Up') {
            steps {
                sh '''
                docker system prune --force
                '''
            }
        }
    }
}