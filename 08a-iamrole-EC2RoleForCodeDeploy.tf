# ---------------------------------------------------------------------------------------------------
# version  2.0
# Library: https://github.com/Frankie116/my-library.git
# Creates iam roles
# ---------------------------------------------------------------------------------------------------

# req:
# 08a-iamrole-ecs-te  - data.aws_iam_policy_document.my-iampd-ecs-task-exec.json
# variables.tf        - var.my-ecs-task-execution-role-name


# resource "aws_iam_role" "my-iamrole-EC2RoleForCodeDeploy" {
#   name                = "my-iam-role"
#   assume_role_policy  = jsonencode({
#     Version           = "2012-10-17"
#     Statement         = [
#       {
#         Action        = "sts:AssumeRole"
#         Effect        = "Allow"
#         Sid           = ""
#         Principal     = {
#           Service     = "ec2.amazonaws.com"
#         }
#       },
#     ]
#   })
#   tags                = {
#     tag-key           = "tag-value"
#   }
# }

data "aws_iam_role" "my-iam-role" {
  name = "EC2RoleForCodeDeploy"
}
