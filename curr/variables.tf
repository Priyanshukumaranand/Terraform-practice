variable "ec2_instance_type" {
  default = "t3.micro"
  type    = string
}
variable "ec2_storage_type" {
  default = 8
  type    = number
}
variable "aws_ami_id" {
  default = "ami-0cb91c7de36eed2cb"
  type    = string
}

variable "ssh_public_key" {
  description = "SSH public key material to register as an EC2 key pair"
  type        = string
}

