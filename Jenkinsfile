pipeline {
    agent any

    environment {
        GOOGLE_APPLICATION_CREDENTIALS = credentials('gcp-service-account') // Your Jenkins GCP JSON credentials ID
        TF_IN_AUTOMATION = "true"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/HaidiZakaria/gcp-terraform-lab.git'
            }
        }

        stage('Terraform Init') {
            steps {
                bat 'terraform init -input=false -force-copy'
            }
        }

        stage('Terraform Format') {
            steps {
                bat 'terraform fmt -check'
            }
        }

        stage('Terraform Validate') {
            steps {
                bat 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                bat 'terraform plan -input=false'
            }
        }

        stage('Terraform Refresh') {
            steps {
                bat 'terraform refresh -input=false'
            }
        }

        stage('Terraform Apply') {
            steps {
                input message: "Apply infrastructure changes?"
                bat 'terraform apply -auto-approve -input=false'
            }
        }
    }

    post {
        success {
            echo '✅ Terraform pipeline completed successfully!'
        }
        failure {
            echo '❌ Build failed. Please check the logs above.'
        }
    }
}
