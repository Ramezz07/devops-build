pipeline {
    agent any

    environment {
        IMAGE_NAME = "Ramezz07/myproj:latest"
        CONTAINER_NAME = "myproj"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'git@github.com:Ramezz07/devops-build.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                  docker build -t $IMAGE_NAME .
                '''
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'docker_username',
                    passwordVariable: 'docker_password'
                )]) {
                    sh '''
                      echo "$docker_password" | docker login -u "$docker_username" --password-stdin
                    '''
                }
            }
        }

        stage('Push Image to Docker Hub') {
            steps {
                sh '''
                  docker push $IMAGE_NAME
                '''
            }
        }

        stage('Deploy Container') {
            steps {
                sh '''
                  docker rm -f $CONTAINER_NAME || true
                  docker run -d -p 80:80 --name $CONTAINER_NAME $IMAGE_NAME
                '''
            }
        }
    }

    post {
        success {
            echo "✅ Deployment Successful"
        }
        failure {
            echo "❌ Deployment Failed"
        }
    }
}

