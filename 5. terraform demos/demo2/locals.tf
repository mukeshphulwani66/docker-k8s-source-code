locals {
  common_tags = {
    Name = "Web_Server"
    Environment = "dev"
    ManagagedByTerrafrom = "true"
  }
  AppName = "${local.common_tags.Name}_${local.common_tags.Environment}" 
}