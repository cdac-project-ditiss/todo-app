pipeline {
    agent any
    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/cdac-project-ditiss/todo-app'
            }
        }
        stage('Build') {
            steps {
                sh 'docker-compose build'
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker stack deploy --compose-file docker-compose.yml todoapp'
            }
        }
    }
    post {
        success {
            mail to: 'noddytester8005@gmail.com', subject: 'Build Success', body: 'ToDo app deployed!'
        }
        failure {
            mail to: 'noddytester8005@gmail.com', subject: 'Build Failed', body: 'Check Jenkins logs.'
        }
    }
}
