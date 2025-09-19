variable "region" {
  type        = string
  description = "The region to deploy the S3 bucket"
  default     = "us-east-1"
}

variable "vpc_resources" {
  type = object({
    cidr_block              = string
    name                    = string
    internet_gateway        = string
    public_route_table_name = string
    public_subnets = list(object({
      name                    = string
      cidr_block              = string
      availability_zone       = string
      map_public_ip_on_launch = bool
    }))
  })
  default = {
    cidr_block              = "10.0.0.0/24"
    name                    = "eks-vpc"
    internet_gateway        = "igw"
    public_route_table_name = "public-route-table"
    public_subnets = [{
      name                    = "public-subnet-1a"
      cidr_block              = "10.0.0.0/27"
      availability_zone       = "us-east-1a"
      map_public_ip_on_launch = true
      },
      {
        name                    = "public-subnet-1b"
        cidr_block              = "10.0.0.64/27"
        availability_zone       = "us-east-1b"
        map_public_ip_on_launch = true
    }]
  }
}

variable "tags" {
  type        = map(string)
  description = "The tags to apply to the S3 bucket"
  default = {
    ManagedBy = "Terraform"
    Project   = "eks-stack"
  }
}
