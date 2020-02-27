# Specify Billing

data "google_billing_account" "acct" {
    billing_account = var.billing_account_id
}


# Create project

resource "random_string" "testnet_random" {
  length    = 4
  special   = false
  lower     = true
  upper     = false
}

resource "google_project" "gke-gitlab" {
  name          = (
      var.is_testnet ? 
      "${var.main_project_id}-testnet" :
      var.main_project_id
    )
  project_id    = (
      var.is_testnet ? 
      "${var.main_project_id}-${random_string.testnet_random.result}" : 
      var.main_project_id
    )

    billing_account = data.google_billing_account.acct.id
}



# Enable services

resource "google_project_service" "enable_services" {
    count       = length(var.services_used)
    project     = google_project.gke-gitlab.project_id
    service     = "${var.services_used[count.index]}.googleapis.com"
    depends_on  = [google_project.gke-gitlab]
}
