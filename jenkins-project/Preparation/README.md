# Jenkins CI/CD Pipeline for Python Application

This Jenkins project automates the build and deployment process of a Python application hosted on GitHub. The repository used is:  
👉 [https://github.com/Raihanarfi12/jenkins-repo](https://github.com/Raihanarfi12/jenkins-repo)

---

## 🔧 Features

- ✅ Builds and deploys Dockerized Python app
- ✅ Uses **Docker Pipeline** and **Python** plugins
- ✅ Jenkinsfile-based pipeline
- ✅ Supports both `main` and `development` branches
- ✅ Automatically triggered on new commits
- ✅ Deploys application via Docker Hub, then it will build apps on remote server (via `sshpass`)

---

## 🛠️ Plugins Used

- [x] Docker Pipeline  
- [x] Pipeline  
- [x] Python Plugin  
- [x] SSH Credentials Plugin  

---

## 📂 Folder Setup

- A folder is created in Jenkins to logically organize the project.
- Inside this folder:
  - Credentials are created (e.g., GitHub, DockerHub, SSH access).
  - Pipelines are defined for `main` and `development` branches.

---

## 📝 Pipeline Flow

1. **Checkout** source code from GitHub.
2. **Build** Docker image using a tag derived from Git commit hash.
3. **Push** Docker image to Docker Hub using credentials.
4. **Deploy** container on a remote server using `sshpass` and Docker.
5. **Triggered Automatically** when new commits are pushed to the branches.

---

## 🚀 Triggering Strategy

Each Jenkins pipeline is set up to be triggered via:
- **SCM polling** or 
- **GitHub webhook** (recommended)

---

## 🔐 Credentials Required

- `dockerhub-creds` – Docker Hub username/password
- `ssh-creds` – SSH username/password for remote server

---

## 🧪 Branch Pipelines

- **Main Pipeline**: Triggered on commits to `main`
- **Development Pipeline**: Triggered on commits to `development`