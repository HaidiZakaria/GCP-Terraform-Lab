terraform {
  backend "gcs" {
    bucket = "terraform-state-haidi"
    prefix = "gcp-terraform-lab/state"
  }
}
