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
  instance-count-pri-dev      = 0
  instance-count-pri-prod     = 0
  instance-count-pub-dev      = 1
  instance-count-pub-prod     = 1
}


resource "aws_instance" "my-server-pri-dev" {
  count                       = local.instance-count-pri-dev
  ami                         = data.aws_ami.my-ami.id
  instance_type               = var.my-instance-type
  subnet_id                   = module.my-vpc.private_subnets[count.index % length(module.my-vpc.private_subnets)]
  vpc_security_group_ids      = [aws_security_group.my-sg-server.id]
  key_name                    = var.my-private-key
  associate_public_ip_address = false
  iam_instance_profile        = aws_iam_instance_profile.my-iam-instance-profile.name
  tags                        = {
    Name                      = "${var.my-instance-name}-pri-dev-0${count.index+1}" 
    Project                   = var.my-project-name
    Environment               = "Development"
    Terraform                 = "true"
  }
}

resource "aws_instance" "my-server-pri-prod" {
  count                       = local.instance-count-pri-prod
  ami                         = data.aws_ami.my-ami.id
  instance_type               = var.my-instance-type
  subnet_id                   = module.my-vpc.private_subnets[count.index % length(module.my-vpc.private_subnets)]
  vpc_security_group_ids      = [aws_security_group.my-sg-server.id]
  key_name                    = var.my-private-key
  associate_public_ip_address = false
  iam_instance_profile        = aws_iam_instance_profile.my-iam-instance-profile.name
  tags                        = {
    Name                      = "${var.my-instance-name}-pri-prod-0${count.index+1}" 
    Project                   = var.my-project-name
    Environment               = "Production"
    Terraform                 = "true"
  }
}

resource "aws_instance" "my-server-pub-dev" {
  count                       = local.instance-count-pub-dev
  ami                         = data.aws_ami.my-ami.id
  instance_type               = var.my-instance-type
  subnet_id                   = module.my-vpc.public_subnets[count.index % length(module.my-vpc.public_subnets)]
  vpc_security_group_ids      = [aws_security_group.my-sg-server.id]
  key_name                    = var.my-private-key
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.my-iam-instance-profile.name
  tags                        = {
    Name                      = "${var.my-instance-name}-pub-dev-0${count.index+1}" 
    Project                   = var.my-project-name
    Environment               = "Development"
    Terraform                 = "true"
  }
}

resource "aws_instance" "my-server-pub-prod" {
  count                       = local.instance-count-pub-prod
  ami                         = data.aws_ami.my-ami.id
  instance_type               = var.my-instance-type
  subnet_id                   = module.my-vpc.public_subnets[count.index % length(module.my-vpc.public_subnets)]
  vpc_security_group_ids      = [aws_security_group.my-sg-server.id]
  key_name                    = var.my-private-key
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.my-iam-instance-profile.name
  tags                        = {
    Name                      = "${var.my-instance-name}-pub-prod-0${count.index+1}" 
    Project                   = var.my-project-name
    Environment               = "Production"
    Terraform                 = "true"
  }
}

