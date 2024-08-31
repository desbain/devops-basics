provider "aws" {
  region = "us-east-1" # Change this to your preferred region
}

resource "aws_security_group" "my-sg" {   
  name_prefix = "my-sg-"

  // Allow all inbound traffic
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "server" {
  ami             = "ami-0aa2b7722dc1b5612" # Ubuntu AMI ID
  instance_type   = "t2.medium"             # Change this to your preferred instance type
  key_name = "desbainKP"
  count = 1

  // Associate the security group with the instance
  security_groups = [aws_security_group.my-sg.name]

  tags = {
    Name = "My-Work-instance"
  }
}

output "public_ips" {
  value = aws_instance.server[*].public_ip
}