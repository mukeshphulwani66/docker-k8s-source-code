# resource "aws_instance" "web" {
#   count = 2
#   ami           = data.aws_ami.amazon_linux_2023.id
#   instance_type = var.instance_type
#   user_data = file("${path.module}/userdata/userdata.sh")
#   key_name = var.instance_KeyPair

#   vpc_security_group_ids = [ aws_security_group.allow_web_ssh.id ]

#   tags = merge(local.common_tags,{
#     Name = "${local.common_tags["Name"]}-${count.index+1}"
#   }) 
# #   tags = merge(local.common_tags,{
# #     AppName=local.AppName
# #   })
# }
resource "aws_instance" "web" {
  # for_each = tomap({
  #   "ap-south-1a" = "t2.micro"
  #   "ap-south-1b" = "t2.micro"
  # })
  for_each = toset(keys({
   for az, details in data.aws_ec2_instance_type_offerings.my_instance_type :
    az => details.instance_types if length(details.instance_types) != 0
  }))
  ami           = data.aws_ami.amazon_linux_2023.id
  instance_type = var.instance_type
  user_data = file("${path.module}/userdata/userdata.sh")
  key_name = var.instance_KeyPair

  vpc_security_group_ids = [ aws_security_group.allow_web_ssh.id ]
  availability_zone = each.key
  tags = merge(local.common_tags,{
    Name = "${local.common_tags["Name"]}-${each.key}"
  }) 

}