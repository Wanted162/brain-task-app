# Brain Tasks App 🚀

This repository contains the deployment of the **Brain Tasks React application** into a production-ready state using **AWS EKS, Docker, and CI/CD pipelines**.

---

## 🔹 Access the Application
The application was deployed on AWS EKS and exposed via an AWS Elastic Load Balancer (ELB).  
- a495cbc6fa5da4838b0165958ba9bf6d-1165788814.ap-south-1.elb.amazonaws.com

---

## 🔹 Steps Implemented

### 1. Application
- Cloned repo: [Brain Tasks App](https://github.com/Vennilavan12/Brain-Tasks-App.git)
- Runs on **port 3000**.

### 2. Docker
- Created a `Dockerfile`.
- Built and tested locally using Docker.
- Pushed image to **AWS ECR**.

### 3. Kubernetes (EKS)
- Deployed app into AWS EKS cluster.
- Created:
  - `Deployment` YAML  
  - `Service` YAML  
- Configured **HPA (Horizontal Pod Autoscaler)** with metrics-server.

### 4. CI/CD Pipeline
- **CodePipeline** with:
  - Source: GitHub  
  - Build: AWS CodeBuild  
  - Deploy: AWS CodeDeploy (EKS via deploy script)  

### 5. Monitoring
- Logs collected in **CloudWatch Logs**.
- Verified scaling using HPA + metrics-server.

---

## 🔹 Repository Structure
├── Dockerfile

├── buildspec.yml

├── appspec.yml

├── scripts/

│ └── deploy.sh

├── k8s/

│ ├── deployment.yaml

│ ├── service.yaml

│ ├── hpa.yaml

│ └── metrics-server-*.yaml

└── README.md
