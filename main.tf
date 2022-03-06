terraform {
  required_providers {
    
    aws={
        source="hashicorp/aws"
        version="~>3.0"
    }
  }
}

provider"aws"{
    region = "us-east-2"

}

resource "aws_vpc" "vpc-dev" {
    cidr_block = "10.0.0.0/16"

  
}
resource "aws_subnet" "public-subnet" {
    vpc_id = aws_vpc.vpc-dev.id
    cidr_block = var.subnet-cidr-blocks
    availability_zone = "us-east-2a"
  
}
output "vpc-id"{
    value=aws_vpc.vpc-dev.id

}
output "subnet-id"{
    value=aws_subnet.public-subnet.id

}

