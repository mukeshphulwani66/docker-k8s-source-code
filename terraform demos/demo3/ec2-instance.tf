
resource "aws_instance" "web" {
  for_each = toset(keys({
    for az, details in data.aws_ec2_instance_type_offerings.my_instance_type :
    az => details.instance_types if length(details.instance_types) != 0
  }))
  ami           = data.aws_ami.amazon_linux_2023.id
  instance_type = var.instance_type
  user_data     = file("${path.module}/userdata/userdata.sh")
  key_name      = var.instance_KeyPair

  vpc_security_group_ids = [aws_security_group.allow_web_ssh.id]
  subnet_id = lookup(
    zipmap(
      module.vpc.azs,
      module.vpc.public_subnets
    ),
    each.key
  )

  tags = merge(local.common_tags, {
    Name = "${local.common_tags["Name"]}-${each.key}"
  })


}
