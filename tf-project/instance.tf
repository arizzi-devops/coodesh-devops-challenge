resource "aws_instance" "instance" {
  count                       = 1 == 2 ? 1 : 0
  tags                        = { Name = "${local.application_name}-ec2" }
  ami                         = "ami-0a0e5d9c7acc336f1"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.subnet_lan.id
  associate_public_ip_address = true
  key_name                    = aws_key_pair.id_rsa.id
  security_groups             = [aws_security_group.allow_ssh.id]
  user_data                   = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y nginx
              systemctl start nginx
              systemctl enable nginx
              echo "Hello World $(date)" > /var/www/html/index.html
              EOF
}
