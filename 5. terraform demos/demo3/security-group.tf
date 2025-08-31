resource "aws_security_group" "allow_web_ssh" {
  name        = "allow_web_ssh"
  description = "Allow SSH, HTTP, and HTTPS inbound traffic"
  tags = {
    Name = "allow_web_ssh"
  }
  vpc_id = module.vpc.vpc_id
}

# SSH port 22
resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.allow_web_ssh.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"

}

# HTTP port 80
resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.allow_web_ssh.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"

}
# HTTPS 443
resource "aws_vpc_security_group_ingress_rule" "allow_https" {
  security_group_id = aws_security_group.allow_web_ssh.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"

}

# --- Egress Rule (Allow all outbound traffic) ---
resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  security_group_id =  aws_security_group.allow_web_ssh.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

