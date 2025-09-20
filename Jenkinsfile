pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = "ap-south-1"
        AWS_ACCOUNT_ID = "907969929387"
        IMAGE_REPO_NAME = "brain-tasks-app"
        IMAGE_TAG = "latest"
        ECR_REGISTRY = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com"
        ECR_IMAGE = "${ECR_REGISTRY}/${IMAGE_REPO_NAME}:${IMAGE_TAG}"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Wanted162/brain-task-app.git'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t $ECR_IMAGE .'
            }
        }

        stage('ECR Login') {
            steps {
                sh 'aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username AWS --password-stdin $ECR_REGISTRY'
            }
        }

        stage('Docker Push') {
            steps {
                sh 'docker push $ECR_IMAGE'
            }
        }

        stage('Deploy to EKS') {
            steps {
                sh 'kubectl set image deployment/brain-tasks-deployment brain-tasks=$ECR_IMAGE -n default'
                sh 'kubectl rollout status deployment/brain-tasks-deployment -n default'
            }
        }
    }
}
