resource "aws_instance" "orange" {
  ami                     = "ami-02a2700d37baeef8b"
  instance_type           = "t2.micro"
  disable_api_termination = false
  key_name                = "nuxt3"
  vpc_security_group_ids  = [aws_security_group.orange-sg.id]
  subnet_id               = aws_subnet.pub-1a.id
  associate_public_ip_address = "true"
  user_data = file("./setup.sh")
  tags = {
    Name = "orange"
  }
}

# TerraformでEC2インスタンスを構築してみた。（Terraform, AWS, EC2）
# https://qiita.com/takahashi-kazuki/items/c2fe3d70e3a9490adf64

output "public_id_of_orange" {
  value = "${aws_instance.orange.public_ip}"
}

