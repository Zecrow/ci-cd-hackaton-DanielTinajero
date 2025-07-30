
provider "aws" {
  region = var.region
}

data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

data "aws_vpc" "selected_vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}


data "aws_subnet" "default_subnet" {
  filter {
    name   = "cidrBlock"
    values = ["10.0.1.0/24"]
  }

  filter {
    name   = "vpc-id"
    values = [aws_vpc.main.id]
  }
}


resource "aws_instance" "web" {
  ami           = data.aws_ami.latest_amazon_linux.id
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.default_subnet.id

  tags = {
    Name = "Mi instancia web 2"
  }
}