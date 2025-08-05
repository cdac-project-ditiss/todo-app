pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-creds') // Jenkins credential ID (username + password or token)
        DOCKER_IMAGE = "patilchinu/loginapp:latest"
        STACK_NAME = "loginapp"
        COMPOSE_FILE = "docker-compose.yml"
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Cloning source code..."
                git branch: 'main', url: 'https://github.com/patilchinu/loginapp.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t $DOCKER_IMAGE ."
                }
            }
        }

        stage('Login to DockerHub') {
            steps {
                script {
                    sh "echo ${DOCKERHUB_CREDENTIALS_PSW} | docker login -u ${DOCKERHUB_CREDENTIALS_USR} --password-stdin"
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                script {
                    sh "docker push $DOCKER_IMAGE"
                }
            }
        }

        stage('Deploy to Docker Swarm') {
            steps {
                script {
                    // Remove previous stack
                    sh "docker stack rm $STACK_NAME || true"

                    // Wait a few seconds for cleanup
                    sh "sleep 10"

                    // Deploy new stack
                    sh "docker stack deploy -c $COMPOSE_FILE $STACK_NAME"
                }
            }
        }
    }

    post {
        success {
            echo "✅ Deployment successful!"
        }
        failure {
            echo "❌ Deployment failed. Check the logs."
        }
    }
}
