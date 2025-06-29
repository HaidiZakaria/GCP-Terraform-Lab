pipeline {
        agent any

    environment {
        GOOGLE_APPLICATION_CREDENTIALS = credentials('gcp-service-account') // ID from Jenkins Credentials
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
                bat 'terraform init'
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
                bat 'terraform plan'
            }
        }


        stage('Terraform Refresh') {
    steps {
        sh 'terraform refresh'
    }
}


        stage('Terraform Apply') {
            steps {
                bat 'terraform apply -auto-approve'
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
