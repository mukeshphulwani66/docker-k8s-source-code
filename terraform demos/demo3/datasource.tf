data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-2023*-x86_64"]
  }
}


data "aws_availability_zones" "availabile" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}


data "aws_ec2_instance_type_offerings" "my_instance_type" {
  for_each = toset(data.aws_availability_zones.availabile.names)
  filter {
    name   = "instance-type"
    values = [var.instance_type]
  }

  filter {
    name   = "location"
    values = [each.key]
  }

  location_type = "availability-zone"
}