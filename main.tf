
# Terraform Cloudの始め方
# https://qiita.com/boccham/items/190f04bfbc9ffc0b5baf

variable "aws_access_key" {}
variable "aws_secret_key" {}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = "ap-northeast-1"
}

resource "aws_vpc" "orange" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "orange-vpc"
  }
}

# Terraformで構築するAWS
# https://y-ohgi.com/introduction-terraform/handson/vpc/

resource "aws_subnet" "pub-1a" {
  vpc_id = "${aws_vpc.orange.id}"
  availability_zone = "ap-northeast-1a"
  cidr_block        = "10.0.1.0/24"
  tags = {
    Name = "orange-pub-1a"
  }
}

resource "aws_subnet" "pub-1c" {
  vpc_id = "${aws_vpc.orange.id}"
  availability_zone = "ap-northeast-1c"
  cidr_block        = "10.0.2.0/24"
  tags = {
    Name = "orange-pub-1c"
  }
}

resource "aws_subnet" "pri-1a" {
  vpc_id = "${aws_vpc.orange.id}"
  availability_zone = "ap-northeast-1a"
  cidr_block        = "10.0.3.0/24"
  tags = {
    Name = "orange-pri-1a"
  }
}

resource "aws_subnet" "pri-1c" {
  vpc_id = "${aws_vpc.orange.id}"
  availability_zone = "ap-northeast-1c"
  cidr_block        = "10.0.4.0/24"
  tags = {
    Name = "orange-pri-1c"
  }
}

resource "aws_internet_gateway" "orange" {
  vpc_id = "${aws_vpc.orange.id}"

  tags = {
    Name = "igw-orange"
  }
}

resource "aws_route_table" "orange" {
  vpc_id = "${aws_vpc.orange.id}"

  tags = {
    Name = "orange-route"
  }
}

resource "aws_route" "orange" {
  destination_cidr_block = "0.0.0.0/0"
  route_table_id         = "${aws_route_table.orange.id}"
  gateway_id             = "${aws_internet_gateway.orange.id}"
}

resource "aws_route_table_association" "pub-1a" {
  subnet_id      = "${aws_subnet.pub-1a.id}"
  route_table_id = "${aws_route_table.orange.id}"
}

resource "aws_route_table_association" "pub-1c" {
  subnet_id      = "${aws_subnet.pub-1c.id}"
  route_table_id = "${aws_route_table.orange.id}"
}

# 【Terraform】AWS上にEC2インスタンス作成(入門)
# https://zenn.dev/supersatton/articles/c87853cc5a3dbd

