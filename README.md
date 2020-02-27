# Project Title

Simple overview of use/purpose.


## Getting Started

### Dependencies

-   [Terraform](https://www.terraform.io/downloads.html) (>0.12)
-   [direnv](https://direnv.net/)

### Installing

Clone the codebase <br>
```
git clone https://github.com/simonbutt/gke-gitlab
cd gke-gitlab
````


Create and populate an `.envrc` file and allow direnv for billing account id <br>
```
echo "TF_VAR_billing_account_id={{billing_account_id}}" > .envrc
direnv allow
```

### Executing program

To run a plan of what is going to be deployed:
```
terraform init main
terraform plan -out="tfplan.out main"
```
To the apply the changes:
```
terraform apply tfplan.out
```