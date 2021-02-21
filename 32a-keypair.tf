# ---------------------------------------------------------------------------------------------------
# version  2.0
# Library: https://github.com/Frankie116/my-library.git
# Creates keypair to ssh to ec2 instances
# ---------------------------------------------------------------------------------------------------

#req:
# variables.tf          - var.my-private-key
# variables.tf          - var.my-public-key
# variables.tf          - var.my-project-name
# variables.tf          - var.my-environment


resource "aws_key_pair" "my-tmp-keypair" {
  key_name               = var.my-private-key
  public_key             = var.my-public-key
  tags                   = {
    Name                 = var.my-private-key
    Project              = var.my-project-name
    Environment          = var.my-environment
    Terraform            = "true"
  }
}