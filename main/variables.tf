variable "billing_account_id" {
  type    = string
}


variable "is_testnet" {
  type      = bool
  default   = true
}


variable "main_project_id" {
  type      = string
  default   = "simon-gke" 
}

variable "region" {
  type      = string
  default   = "europe-west1"
}

variable "services_used" {
  type      = list
  default   = [
      "container",
      "servicenetworking",
      "cloudresourcemanager",
      "redis"
  ]
}

