pipeline {
    agent {
        label 'swarm-manager'
    }

    stages {
        stage('Deploy to Docker Swarm') {
            steps {
                echo '📦 Starting deployment...'
                sh 'docker stack deploy -c docker-compose.yml loginapp'
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
