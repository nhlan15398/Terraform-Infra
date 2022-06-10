data "aws_ami" "amazon-linux-2" {
    most_recent = true
    filter {
      name = "name"
      values = ["amzn2-ami-kernel-5.10-hvm-2.0.20220426.0-x86_64-gp2"]
    }
    filter {
      name = "virtualization-type"
      values = ["hvm"]
    }
    owners = [ "137112412989" ]
}

resource "aws_instance" "HelloWorld" {
  ami = data.aws_ami.amazon-linux-2.id
  instance_type = var.instance_type
  associate_public_ip_address = true
  subnet_id = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.allow_http_ssh.id]
  key_name = aws_key_pair.nhlan-public-key.key_name
#  ebs_block_device {
#    device_name = "/dev/xvda"
#    volume_size = 50
#  }
  user_data = "${file("templates/hello.sh")}"
  timeouts {
    create = "100s"
    update = "100s"
    delete = "100s"
  }
  tags = {
    Name = "HelloWorld"
  }
}