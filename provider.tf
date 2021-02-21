# ---------------------------------------------------------------------------------------------------
# version  2.0
# Library: https://github.com/Frankie116/my-library.git
# provider details
# ---------------------------------------------------------------------------------------------------

# req:
# # variables.tf           - var.my-aws-region


provider "aws" {
  shared_credentials_file  = "$HOME/.aws/credentials"
  profile                  = "default"
  region                   = var.my-aws-region
}