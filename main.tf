variable "AWS_ACCESS_KEY_ID" {
  description = "AWS access key ID"
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "AWS secret access key"
}

provider "aws" {
  region     = "us-east-2"
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
}

resource "aws_instance" "example" {
  ami           = "ami-0c94855ba95c71c99"
  instance_type = "t2.micro"
}
