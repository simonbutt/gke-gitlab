# Provider and remote state

provider "google" {
  region    = var.region
}

terraform {
    backend "gcs" {
        bucket = "gke-gitlab-tfstate"
    }
}


