variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
#   default     = "ap-south-1"

  validation {
    condition     = length(var.aws_region) > 2
    error_message = "length of region should be greater then 2"
  }
}

variable "instance_type" {
  description = "EC2 instance type"
  type = string
#   default = "t2.micro"
}

variable "instance_type_list" {
  description = "EC2 instance type list"
  type = list(string)
  default = ["t2.micro","t2.small","t2.medium"]
}

variable "instance_tags" {
  description = "Tags for EC2"
  type = map(string)
  default = {
    Name = "Web_Server"
    Environment = "dev"
    ManagagedByTerrafrom = "true"
  }
}

variable "instance_KeyPair" {
  description = "AWS EC2 Key Pair that need to be associated with EC2 Instance"
  type = string
#   default = "mumbai-terraform"
}