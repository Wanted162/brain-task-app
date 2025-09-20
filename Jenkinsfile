pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = "ap-south-1"
        ECR_REGISTRY = "907969929387.dkr.ecr.ap-south-1.amazonaws.com"
        ECR_REPOSITORY = "brain-tasks-app"
        IMAGE_TAG = "latest"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Wanted162/brain-task-app.git'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t $ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG .'
            }
        }

        stage('ECR Login') {
            steps {
                sh 'aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username AWS --password-stdin $ECR_REGISTRY'
            }
        }

        stage('Docker Push') {
            steps {
                sh 'docker push $ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG'
            }
        }

        stage('Deploy to EKS') {
            steps {
                sh 'aws eks update-kubeconfig --region $AWS_DEFAULT_REGION --name brain-tasks-cluster'
                sh 'kubectl apply -f k8s/deployment.yaml'
                sh 'kubectl apply -f k8s/service.yaml'
            }
        }
    }
}
