# ---------------------------------------------------------------------------------------------------
# version  2.0
# Library: https://github.com/Frankie116/my-library.git
# Creates a new ec2 instance
# ---------------------------------------------------------------------------------------------------

# req:
# 01a-vpc.tf           - module.my-vpc.private_subnets
# 04a-sg-server.tf     - [aws_security_group.my-sg-server.id]
# variables.tf         - var.my-instances-per-subnet
# variables.tf         - var.my-ami
# variables.tf         - var.my-instance-type
# variables.tf         - var.my-private-key
# variables.tf         - var.my-servername
# variables.tf         - var.my-project-name
# variables.tf         - var.my-environment


locals {
  instance-count              = var.my-instances-per-subnet * length(module.my-vpc.private_subnets)
  instance-count-public       = var.my-instances-per-subnet * length(module.my-vpc.public_subnets)
}


resource "aws_instance" "my-server" {
  count                       = local.instance-count
  ami                         = data.aws_ami.my-ami.id
  instance_type               = var.my-instance-type
  subnet_id                   = module.my-vpc.private_subnets[count.index % length(module.my-vpc.private_subnets)]
  vpc_security_group_ids      = [aws_security_group.my-sg-server.id]
  key_name                    = var.my-private-key
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.my-iam-instance-profile.name
  tags                        = {
    Name                      = "${var.my-instance-name}-dev-0${count.index+1}" 
    Project                   = var.my-project-name
    Environment               = "Development"
    Terraform                 = "true"
  }
}

resource "aws_instance" "my-server-public" {
  count                       = local.instance-count-public
  ami                         = data.aws_ami.my-ami.id
  instance_type               = var.my-instance-type
  subnet_id                   = module.my-vpc.public_subnets[count.index % length(module.my-vpc.public_subnets)]
  vpc_security_group_ids      = [aws_security_group.my-sg-server.id]
  key_name                    = var.my-private-key
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.my-iam-instance-profile.name
  tags                        = {
    Name                      = "${var.my-instance-name}-prod-0${count.index+1}" 
    Project                   = var.my-project-name
    Environment               = "Production"
    Terraform                 = "true"
  }
}