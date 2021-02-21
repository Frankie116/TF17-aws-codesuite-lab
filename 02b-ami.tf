# ---------------------------------------------------------------------------------------------------
# version  2.0
# Library: https://github.com/Frankie116/my-library.git
# Creates a new standard amazon linux ami
# ---------------------------------------------------------------------------------------------------

# req:
# 30a-random-string.tf   - random_string.my-random-string.result
# variables.tf           - var.my-tags (tbc)
# variables.tf           - var.my-project-name
# variables.tf           - var.my-environment


data "aws_ami" "my-ami" {
  most_recent            = true
  owners                 = [var.my-ami-owners]
  filter {
    name                 = "name"
    values               = [var.my-ami-name]
  }
  tags                   = {
    Name                 = "my-ami-amazon2-${random_string.my-random-string.result}"
    Project              = var.my-project-name
    Environment          = var.my-environment
    Terraform            = "true"
  }
}



