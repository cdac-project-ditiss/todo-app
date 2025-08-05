pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/cdac-project-ditiss/todo-app.git'
            }
        }
        stage('Deploy to Docker Swarm') {
            steps {
                sh 'docker stack deploy -c docker-compose.yml todoapp'
            }
        }
    }

    post {
        success {
            echo '✅ Auto Deployment Successful!'
        }
        failure {
            echo '❌ Deployment Failed.'
        }
    }
}
