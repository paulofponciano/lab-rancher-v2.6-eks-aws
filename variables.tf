variable "project_name" {
  default = "pegasus-2"
}

variable "env" {
  default = "dev"
}

variable "rancher_name" {
  default = "rancher-node"
}

variable "eks-sg" {
  type    = string
  default = "sg-03468a76eba533c6f"
}

variable "vpc_cidr_block" {
  type    = string
  default = "172.28.0.0/16"
}

variable "subnet_id_public_az1" {
  type    = string
  default = "subnet-05343e4dc141521f9"
}

variable "subnet_id_public_az2" {
  type    = string
  default = "subnet-06ea2c1ad38d32f17"
}

variable "subnet_id_private_az1" {
  type    = string
  default = "subnet-00a6a9c32c50a97ba"
}

variable "subnet_id_private_az2" {
  type    = string
  default = "subnet-06cc1a1b63da22f8f"
}

variable "aws_details" {
  type = map(string)
  default = {
    region        = "us-east-2"
    instance_type = "t3.medium"
    key_name      = "k8s" #keypair (.pem)
  }
}
