variable "env" {
  description = "This is the env for my infra"
  type        = string
}
variable "bucket_name" {
  default     = "my-app-bucket-453465476587634"
  description = "This is the bk for my infra"
  type        = string
}
variable "inst_cnt" {
  description = "This is the no of EC2-instance"
  type        = number
}
variable "ec2_instance_type" {
  description = "This is the instance type"
  default     = "t3.micro"
  type        = string
}
variable "aws_ami_id" {
  default = "ami-0cb91c7de36eed2cb"
  type    = string
}
# variable "ec2_storage_type" {
#   default = 8
#   type    = number
# }

variable "hash_key" {
  description = "This is a hash key"
  type        = string
}
