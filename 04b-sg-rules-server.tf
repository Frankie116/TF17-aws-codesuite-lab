# ---------------------------------------------------------------------------------------------------
# version  2.0
# Library: https://github.com/Frankie116/my-library.git
# Creates security group rules
# ---------------------------------------------------------------------------------------------------

#req:
# 04a-sg-server.tf          - aws_security_group.my-sg-server.id
# 04a-sg-jumpbox            - aws_security_group.my-sg-jumpbox.id
# variables.tf              - var.my-port-app1


resource "aws_security_group_rule" "my-sg-irule-server1" {
  description               = "allow app1 port inbound"
  security_group_id         = aws_security_group.my-sg-server.id
  type                      = "ingress"
  protocol                  = "tcp"
  from_port                 = var.my-port-app1
  to_port                   = var.my-port-app1
  cidr_blocks             = ["0.0.0.0/0"]
  # source_security_group_id  = aws_security_group.my-sg-lb.id
  depends_on                = [aws_security_group.my-sg-server]
}


resource "aws_security_group_rule" "my-sg-irule-server2" {
  description               = "allow only app1 port inbound from alb only"
  security_group_id         = aws_security_group.my-sg-server.id
  type                      = "ingress"
  protocol                  = "tcp"
  from_port                 = 22
  to_port                   = 22
  cidr_blocks             = ["0.0.0.0/0"]
  # source_security_group_id  = aws_security_group.my-sg-jumpbox.id
  depends_on                = [aws_security_group.my-sg-server]
}


resource "aws_security_group_rule" "my-sg-irule-server3" {
  description               = "allow only app1 port inbound from alb only"
  security_group_id         = aws_security_group.my-sg-server.id
  type                      = "ingress"
  protocol                  = "tcp"
  from_port                 = 443
  to_port                   = 443
  cidr_blocks             = ["0.0.0.0/0"]

  depends_on                = [aws_security_group.my-sg-server]
}


resource "aws_security_group_rule" "my-sg-erule-server1" {
  description               = "allow any port to exit server to anywhere"
  security_group_id         = aws_security_group.my-sg-server.id
  type                      = "egress"
  protocol                  = "-1"
  from_port                 = 0
  to_port                   = 0
  cidr_blocks               = ["0.0.0.0/0"]
  depends_on                = [aws_security_group.my-sg-server]
}