data "terraform_remote_state" "dev_vpc" {
  backend = "s3"
  config {
    bucket = "jhg-tf-remote-state"
    key = "development/vpc.tfstate"
  }
}

data "terraform_remote_state" "core" {
  backend = "s3"
  config {
    bucket = "jhg-tf-remote-state"
    key = "main/main.tfstate"
  }
}
