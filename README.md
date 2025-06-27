<<<<<<< HEAD
# 🚀 GCP Terraform Lab: Public Web Server + Cloud Storage

This project demonstrates how to deploy a public-facing Apache web server on Google Cloud Platform (GCP) using Terraform. It provisions a secure virtual network, sets up a compute instance, configures firewall rules, and deploys a static web page — all fully automated as Infrastructure as Code (IaC).

---

## 🧰 Tools & Technologies

- **Google Cloud Platform**
- **Terraform**
- **Compute Engine**
- **Cloud Storage**
- **Ubuntu 22.04 LTS**
- **Apache Web Server**

---

## 🏗️ Infrastructure Overview

### 🔹 VPC Network
- Auto-mode VPC (`multi-cloud-vpc`)
- Ingress firewall allows **SSH (22)** and **HTTP (80)**

### 🔹 VM Instance
- Ubuntu 22.04 LTS
- Apache2 installed on boot via startup script
- Public IP accessible at: [`http://34.76.12.212`](http://34.76.12.212)

### 🔹 Cloud Storage
- Storage bucket created and named:  
  `mc-bucket-[PROJECT_ID]`

---

## ⚙️ Terraform Files

| File        | Description                                 |
|-------------|---------------------------------------------|
| `main.tf`   | Declares all infrastructure resources        |
| `variables.tf` | Holds reusable variable definitions       |
| `outputs.tf`   | Displays public VM IP after deployment    |

---

## ⚖️ How to Use

1. Clone the repo:
   ```bash
   git clone https://github.com/yourusername/gcp-terraform-lab.git
   cd gcp-terraform-lab
   ```

2. Initialize Terraform:
   ```bash
   terraform init
   ```

3. Set your project and region in `terraform.tfvars` or via CLI.

4. Apply the configuration:
   ```bash
   terraform apply
   ```

5. Access the public web server:
   ```
   http://<terraform output vm_ip>
   ```

---

## 📈 Output

```
Hello from GCP VM
```

---

## 📙 What I Learned

- Automating infrastructure with Terraform
- Setting up firewall rules, public IPs, and metadata scripts
- Debugging network/subnet/IP assignment on GCP
- Practical experience with VM provisioning in a cloud environment

---

## 🧠 Author

**Haidi Zakaria**  
Cloud Engineering Enthusiast | Certified AWS ,Azure & IBM cloud
[LinkedIn Profile](www.linkedin.com/in/haidi-zakaria-bb424152)
=======
# GCP Terraform Lab

This project provisions a Google Cloud Compute Engine instance using Terraform.
>>>>>>> d93acc4 (Rebuild GCP Terraform lab)
