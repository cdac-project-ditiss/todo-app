pipeline {
    agent any

    stages {
        stage('Deploy to Docker Swarm') {
            steps {
                sh 'docker stack deploy -c docker-compose.yml todoapp'
            }
        }
    }

    post {
        success {
            echo '✅ Deployment Successful!'
        }
        failure {
            echo '❌ Deployment Failed.'
        }
    }
}
