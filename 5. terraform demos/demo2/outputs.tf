# output "public_dns" {
#   description = "Output the value of dns name"
#   value = aws_instance.web.public_dns
# }
# output "public_IP" {
#   description = "Output the value of pulic ip"
#   value = aws_instance.web.public_ip
# }

# output "public_dns" {
#   description = "Output the value of dns name"
#   value = aws_instance.web[*].public_dns
# }
# output "public_IP" {
#   description = "Output the value of pulic ip"
#   value = aws_instance.web[*].public_ip
# }

output "output_with_list" {
  description = "for loop with list"
  value       = [for i in aws_instance.web : i.public_dns]
}

output "output_with_map" {
  description = "for loop with map"
  value       = { for i in aws_instance.web : i.public_ip => i.public_dns }
}


output "all-availabile-AZs" {
  value = data.aws_availability_zones.availabile.names
}

output "all-supported-AZs" {
  value = keys({
   for az, details in data.aws_ec2_instance_type_offerings.my_instance_type :
    az => details.instance_types if length(details.instance_types) != 0
  })
}



