resource "aws_s3_bucket" "remote_s3" {
  bucket = "my-app-bucket-4534654765876"
  tags = {
    Name = var.bucket_name
  }
} 