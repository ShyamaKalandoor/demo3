# Define AWS provider
provider "aws" {
  region = "us-east-1" # Update with desired region
}

# Define variables
variable "instance_name" {
  default = "my-ec2-instance" # Update with desired instance name
}

# Create EC2 instance
resource "aws_instance" "ec2_instance" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI ID
  instance_type = "m5.large"
  key_name      = "my-keypair" # Update with desired key pair name
  tags = {
    Name = var.instance_name
  }

  # Open port 0.0.0.0/0 to all traffic
  security_groups = ["default"]
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
