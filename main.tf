# Creating ec2 instance and connecting vpc and security group
 resource "aws_instance" "demo" {
  tags = {
    Name = "server-1"
  }

  ami               = var.ami-id
  instance_type     = var.instance-type
  key_name          = "linux-m3"
  availability_zone = var.az
  root_block_device {
    volume_size = var.vs
  }
  subnet_id = aws_subnet.publicSubnet.id
  vpc_security_group_ids =  [ aws_security_group.sg.id ]

}

