# ---------------------------------------------------------------------------------------------------
# version  2.0
# Library: https://github.com/Frankie116/my-library.git
# Creates iam roles
# ---------------------------------------------------------------------------------------------------

# req:
# variables.tf - var.my-iamrole-name


data "aws_iam_role" "my-iam-role" {
  name         = var.my-iamrole-name
}


resource "aws_iam_instance_profile" "my-iam-instance-profile" {
  name         = "my-iam-instance-profile"
  role         = data.aws_iam_role.my-iam-role.name
}

