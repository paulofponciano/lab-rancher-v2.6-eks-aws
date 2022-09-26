# SECURITY GROUP TO RANCHER NODE

resource "aws_security_group" "rancher-sg" {
  name        = join("-", [var.project_name, "sg-rancher"])
  description = "Allow external traffic to rancher console"
  vpc_id      = data.aws_subnet.selected-public_az1.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]


  }

  tags = {
    Name      = join("-", [var.project_name, "sg-rancher"])
    Env       = var.env
    Terraform = true
  }
}
