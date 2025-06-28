pipeline {
  agent any

  environment {
    GOOGLE_APPLICATION_CREDENTIALS = credentials('gcp-sa-key')
  }

  stages {
    stage('Checkout') {
      steps {
        git 'https://github.com/HaidiZakaria/gcp-terraform-lab.git'
      }
    }

    stage('Terraform Init') {
      steps {
        sh 'terraform init'
      }
    }

    stage('Terraform Plan') {
      steps {
        sh 'terraform plan'
      }
    }

    stage('Terraform Apply') {
      steps {
        input "Approve apply?"
        sh 'terraform apply -auto-approve'
      }
    }
  }
}
