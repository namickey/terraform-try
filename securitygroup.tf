# terraform構築手順〜EC2編〜
# https://colabmix.co.jp/tech-blog/terraform-ec2/

resource "aws_security_group" "orange-sg" {
  name        = "orange-sg"
  description = "orange-sg"
  vpc_id      = aws_vpc.orange.id
  tags = {
    Name = "orange-sg"
  }
}

resource "aws_security_group_rule" "inbound_ssh" {
  type      = "ingress"
  from_port = 22
  to_port   = 22
  protocol  = "tcp"
  cidr_blocks = [
    "0.0.0.0/0",
  ]
  security_group_id = aws_security_group.orange-sg.id
}

resource "aws_security_group_rule" "inbound_nodejs" {
  type      = "ingress"
  from_port = 3000
  to_port   = 3000
  protocol  = "tcp"
  cidr_blocks = [
    "0.0.0.0/0",
  ]
  security_group_id = aws_security_group.orange-sg.id
}

resource "aws_security_group_rule" "outbound_all" {
  type      = "egress"
  from_port = 0
  to_port   = 0
  protocol  = "-1"
  cidr_blocks = [
    "0.0.0.0/0",
  ]
  security_group_id = aws_security_group.orange-sg.id
}


