variable "project_name" {
  default = "pegasus"
}

variable "env" {
  default = "dev"
}

variable "rancher_name" {
  default = "rancher-2-6-8"
}

variable "vpc_cidr_block" {
  type    = string
  default = "172.32.0.0/16"
}

variable "subnet_id_public_az1" {
  type    = string
  default = "subnet-01fb300640c4d4099"
}

variable "subnet_id_public_az2" {
  type    = string
  default = "subnet-04d75898fb1e0acb0"
}

variable "subnet_id_private_az1" {
  type    = string
  default = "subnet-078079f8022c7ba1d"
}

variable "subnet_id_private_az2" {
  type    = string
  default = "subnet-02bb72ea163cdc95f"
}

variable "aws_details" {
  type = map(string)
  default = {
    region        = "us-east-1"
    instance_type = "t3.medium"
    key_name      = "k8s" #keypair (.pem)
  }
}
