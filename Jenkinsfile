pipeline {
<<<<<<< HEAD
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform --version || true'
                sh 'terraform init'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
=======
  agent any

  environment {
    GOOGLE_APPLICATION_CREDENTIALS = credentials('gcp-sa-key')
  }

  stages {
    stage('Checkout') {
      steps {
        git 'https://github.com/HaidiZakaria/GCP-Terraform-Lab.git'
      }
    }

    stage('Terraform Init') {
      steps {
        bat 'terraform init'
      }
    }

    stage('Terraform Plan') {
      steps {
        bat 'terraform plan'
      }
    }

    stage('Terraform Apply') {
      steps {
        input "Apply infrastructure changes?"
        bat 'terraform apply -auto-approve'
      }
    }
  }
>>>>>>> ec67583 (Add Jenkinsfile for Terraform CI/CD on Windows)
}
