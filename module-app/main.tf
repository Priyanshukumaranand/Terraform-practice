module "dev-infra" {
  source            = "./infra-app"
  env               = "dev"
  bucket_name       = "my-app-bucket-4534654765876"
  inst_cnt          = 2
  ec2_instance_type = "t3.small"
  aws_ami_id        = "ami-0b671272c81662a99"
  hash_key          = "studentID"
}
module "prod-infra" {
  source            = "./infra-app"
  env               = "prod"
  bucket_name       = "my-app-bucket-4534654765876"
  inst_cnt          = 1
  ec2_instance_type = "t3.small"
  aws_ami_id        = "ami-0b671272c81662a99"
  hash_key          = "studentID"

}
module "stg-infra" {
  source            = "./infra-app"
  env               = "stg"
  bucket_name       = "my-app-bucket-4534654765876"
  inst_cnt          = 1
  ec2_instance_type = "t3.micro"
  aws_ami_id        = "ami-0b671272c81662a99"
  hash_key          = "studentID"

}
