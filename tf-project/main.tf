resource "aws_key_pair" "id_rsa" {
  key_name   = "${local.application_name}-key_pair"
  public_key = file("../config/keys/id_rsa.pub")
}

resource "aws_vpc" "vpc" {
  tags                 = { Name = "${local.application_name}-vpc" }
  cidr_block           = "10.127.11.0/24"
  enable_dns_support   = true
  enable_dns_hostnames = true
}

resource "aws_subnet" "subnet_lan" {
  tags       = { Name = "${local.application_name}-subnet_lan" }
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.127.11.0/25"
}

# resource "aws_subnet" "subnet_dmz" {
#   tags       = { Name = "${local.application_name}-subnet_dmz" }
#   vpc_id     = aws_vpc.vpc.id
#   cidr_block = "10.127.11.128/25"
# }

resource "aws_route_table" "route_table" {
  tags   = { Name = "${local.application_name}-route_table" }
  vpc_id = aws_vpc.vpc.id
}

resource "aws_route_table_association" "subnet_lan_association" {
  subnet_id      = aws_subnet.subnet_lan.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_internet_gateway" "gw" {
  tags   = { Name = "${local.application_name}-internet_gateway" }
  vpc_id = aws_vpc.vpc.id
}

resource "aws_route" "route" {
  route_table_id         = aws_route_table.route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id
}

resource "aws_security_group" "allow_ssh" {
  tags   = { Name = "${local.application_name}-security_group" }
  name   = "${local.application_name}-security_group"
  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
