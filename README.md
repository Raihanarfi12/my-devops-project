# 💻 DevOps Projects

This repository contains two DevOps-focused projects showcasing containerization and infrastructure-as-code (IaC) principles using **Docker** and **Terraform**. Each project is organized in its respective folder.

---

## 📦 Project 1: Docker-based Web Application

### 🔧 Description
A simple Dockerized web application that demonstrates container creation, Dockerfile usage, and multi-container orchestration with Docker Compose.
Component :
- Application
- Database
- Monitoring (Grafana and Prometheus)
- Jenkins
- Sonarqube
- Proxy (Nginx)

## 📦 Project 2: Three-tier web Application on AWS
A simple Three-tier web application on AWS
Component :
- ALB
- Auto scaling group
- ECS (Elastic Container Service)
- Network (VPC, subnet)
- RDS
- S3

## 📦 Project 3: CI/CD Pipeline with Jenkins
###🔧 Description
This project demonstrates a complete CI/CD pipeline setup using Jenkins for a Python application, highlighting automation in testing, Docker image creation, and deployment workflows.

### 🔨 Preparation
A custom Jenkins container was created with all required dependencies pre-installed, including:
- Docker CLI for building and running images
- Python, pip, and venv for managing virtual environments

### 🔁 Pipelines
🔄 Development Branch
- Install Python dependencies
- Run automated tests
- Send email notifications for every build, regardless of success or failure

🚀 Main Branch
- Build a Docker image, tagged using the latest commit hash
- Push the image to a Docker registry
- Deploy the application using docker run from the built image

This project provides hands-on experience with:
- Jenkins pipeline-as-code
- CI/CD best practices for Python apps
- Docker-based deployment automation
