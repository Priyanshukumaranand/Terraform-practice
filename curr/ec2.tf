//make key pair for ec2 instance
resource "aws_key_pair" "my_key" {
  key_name   = "terra-key-ec2"
  public_key = var.ssh_public_key
}

//VPC 
resource "aws_default_vpc" "default" {
  # cidr_block = "10.0.0.0/16"
}

//security group for ec2 instance
resource "aws_security_group" "my_sg" {
  name        = "my_sg"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_default_vpc.default.id #interpolation to get the VPC ID
  #inbound rules for security group
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #allow SSH from anywhere
    description = "Allow SSH"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #allow HTTP from anywhere
    description = "Allow HTTP"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"          #allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"] #allow all outbound traffic
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "my_sg"
  }
}

resource "aws_instance" "my_instance" {
  count           = 2
  # for_each = tomap({
  #   pkmicro="t2.micro",
  #   pksmall="t2.micro",


  # })
  key_name        = aws_key_pair.my_key.key_name
  security_groups = [aws_security_group.my_sg.name]
  instance_type   = var.ec2_instance_type
  ami             = var.aws_ami_id
  user_data       = file("nginx.sh")

  root_block_device {
    volume_size =  20
    volume_type = "gp3"
  }
  tags = {
    Name = "Abc"
  }
}
