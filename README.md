# GCP Terraform Project with Jenkins CI/CD Integration

## Project Structure
```
gcp-terraform-lab/
├── main.tf
├── variables.tf
├── outputs.tf
├── backend.tf
├── terraform.tfvars
├── Jenkinsfile
├── README.md
└── .gitignore
```

## Step-by-Step Guide

### ✅ 1. Set up your GCP environment
- Create a GCP project (if not already created).
- Enable required APIs: Compute Engine API, Cloud Resource Manager API.
- Create a service account with the necessary IAM roles (e.g., Compute Admin, Storage Admin).
- Download the service account key JSON.

### ✅ 2. Initialize the Terraform project
- Define infrastructure in `main.tf`, variables in `variables.tf`, and outputs in `outputs.tf`.
- Add your credentials and project details in `terraform.tfvars`.
- Configure `backend.tf` for GCS remote state.

### ✅ 3. Validate Terraform manually
```bash
terraform init
terraform plan
terraform apply
```

### ✅ 4. Create a GCS bucket for remote backend
```bash
gsutil mb -p YOUR_PROJECT_ID -l REGION gs://terraform-state-YOUR_NAME
```
Update `backend.tf` accordingly:
```hcl
terraform {
  backend "gcs" {
    bucket  = "terraform-state-YOUR_NAME"
    prefix  = "gcp-terraform-lab/state"
  }
}
```
Then run:
```bash
terraform init -reconfigure
```

### ✅ 5. Install Jenkins (Windows)
- Install Java 21+.
- Install Jenkins using the Windows installer.
- Run Jenkins as a local service.
- Set up admin user and install suggested plugins.

### ✅ 6. Configure Jenkins for Terraform
- Install required plugins: Pipeline, Git, Credentials.
- Create credentials:
  - GCP service account key (secret file)
  - GitHub (username/password or token)
- Create a new Pipeline job linked to your GitHub repo.

### ✅ 7. Add `Jenkinsfile` to project root
```groovy
pipeline {
    agent any

    environment {
        GOOGLE_APPLICATION_CREDENTIALS = credentials('gcp-service-account')
        TF_IN_AUTOMATION = "true"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/YOUR_USERNAME/gcp-terraform-lab.git'
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
                bat 'terraform plan -input=false'
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
```

### ✅ 8. Push project to GitHub
```bash
cd C:\Users\1\Documents\gcp-terraform-lab
git init
git remote add origin https://github.com/YOUR_USERNAME/gcp-terraform-lab.git
git add .
git commit -m "Automated GCP infra setup with Terraform and Jenkins CI/CD"
git push -u origin main --force
```

### ✅ 9. Trigger Jenkins build
- Run the pipeline from Jenkins dashboard.
- Monitor output and validate external IP from Terraform output.

### ✅ 10. Verify the deployment
- Visit the Apache default page at the VM’s external IP.
  - Example: `http://34.77.242.16/`

------------------------------------------
