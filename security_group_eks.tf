resource "aws_security_group" "default" {
  name   = join("-", [var.project_name, "sg-eks"])
  vpc_id = data.aws_subnet.selected-public_az1.vpc_id

  egress {
    from_port = 0
    to_port   = 0

    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name"    = join("-", [var.project_name, "sg-eks"])
    "Env"     = "${var.env}"
    Terraform = true
  }

}

resource "aws_security_group_rule" "self_internal" {
  from_port   = "0"
  to_port     = "0"
  self        = true
  description = "self_internal"
  protocol    = "-1"

  security_group_id = aws_security_group.default.id
  type              = "ingress"
}

resource "aws_security_group_rule" "nodeport_tcp" {
  cidr_blocks = ["0.0.0.0/0"]
  from_port   = 30000
  to_port     = 32768
  description = "nodeport_istio"
  protocol    = "tcp"

  security_group_id = aws_security_group.default.id
  type              = "ingress"
}

resource "aws_security_group_rule" "vpc_full_ingress" {
  cidr_blocks = [var.vpc_cidr_block]
  from_port   = "0"
  to_port     = "0"
  description = "vpc_ingress"
  protocol    = "-1"

  security_group_id = aws_security_group.default.id
  type              = "ingress"
}
