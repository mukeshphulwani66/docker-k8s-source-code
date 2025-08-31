module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.0.1"

  name = "dev-vpc-tf"
  cidr = "10.10.0.0/16"
  azs  = slice(data.aws_availability_zones.availabile.names, 0, 2)

  public_subnets = [for i in range(2) : cidrsubnet("10.10.0.0/16", 8, i)]
  # ["10.10.0.0/24", "10.10.1.0/24"]
  private_subnets = [for i in range(2) : cidrsubnet("10.10.0.0/16", 8, i + 10)]
  # ["10.10.10.0/24","10.10.11.0/24"]
  public_subnet_names = [for i in range(2) : "Public subnet ${i+1}"] 
  private_subnet_names = [for i in range(2) : "Private subnet ${i+1}"] 

  enable_dns_hostnames = true
  enable_dns_support = true
  manage_default_security_group = false
  map_public_ip_on_launch = true

  tags = {
    Environment = "dev"
    ManagagedByTerrafrom = "yes"
  }

}
