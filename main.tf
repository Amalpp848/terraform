" {
  region = "ap-south-1"
}

resource "aws_instance" "example" {
  ami           = "ami-025fe52e1f2dc5044"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleInstance"
  }

  key_name = "1stkey"
  vpc_security_group_ids = [aws_security_group.example.id]

  root_block_device {
    volume_size = 10
    volume_type = "gp2"
  }
}

resource "aws_security_group" "example" {
  name        = "example-security-group"
  description = "Allow SSH and HTTP traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

