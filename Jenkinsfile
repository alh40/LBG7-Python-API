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
                
                withCredentials([usernamePassword( credentialsId: 'dockerhub', usernameVariable: 'USER', passwordVariable: 'PASSWORD')]){
                    def registry_URL = "https://hub.docker.com/repository/docker/"
                    bat "docker login -u $USER -p $PASSWORD ${registry_URL}"
                    docker.withRegistry("http://${registry_URL}", "dockerhub"){
                        sh '''
                        docker-compose push
                        '''
                    }
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