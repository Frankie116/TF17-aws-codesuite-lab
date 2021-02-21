# ---------------------------------------------------------------------------------------------------
# version  2.0
# Library: https://github.com/Frankie116/my-library.git
# outputs
# ---------------------------------------------------------------------------------------------------

# req:
# None


# # 05a-alb.tf      --------------------------------------------------------------------
# output my-website-address {
#   description  = "Full website addresss including port number"
#   value        = "${aws_route53_record.my-dns-record.fqdn}:${var.my-docker-port}"
# }

# # output my-website-address2 {
# #   description = "Full website addresss including port number"
# #   value       = [aws_route53_record.my-dns-record.*.fqdn]
# # }


# # 06b-route53-record-lb.tf ----------------------------------------------------------
# output my-http-website-address {
#   description  = "Full website addresss including port number"
#   value        = " http://${aws_route53_record.my-dns-record-lb.fqdn}"
# }

# output my-https-website-address {
#   description  = "Full website addresss including port number"
#   value        = "https://${aws_route53_record.my-dns-record-lb.fqdn}"
# }

# output my-https-admin-address {
#   description  = "Full website addresss including port number"
#   value        = "  https://${aws_route53_record.my-dns-record-lb.fqdn}/wp-admin/"
# }

# output ssh-server-details {
#   value        = " ssh bitnami@${aws_instance.my-server[0].private_ip}"
# }


# # 06d-route53-record-jumpbox.tf -----------------------------------------------------
# output my-jumpbox-address {
#   description  = "Full website addresss including port number"
#   value        = [aws_route53_record.my-dns-record-jumpbox.*.fqdn]
# }

# output ssh-jumpbox-details {
#   value        = "ssh -A ec2-user@my-jumpbox-01.${var.my-existing-dns-zone} -i ${var.my-private-key}.pem"
# }


# # 09c-template-file ----------------------------------------------------------
# output my-ecs-cd-file {
#   description  = "Name of the container definition"
#   value        = var.my-ecs-cd-file 
# }

