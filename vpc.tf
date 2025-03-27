# Step-1 Create VPC
resource "aws_vpc" "myvpc" {
  tags = {
    Name = "vpc-1"
  }
  cidr_block = "10.0.0.0/24"
}

# Step-2 Create a Public_Subnet
resource "aws_subnet" "publicSubnet" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = "10.0.0.0/25"
  availability_zone = "eu-west-1b"
}

# Step-3 Create Internet_Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id
}

# Step-4 Create Route_table
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

# Step-5 create route_table_association 
resource "aws_route_table_association" "rta" {
  route_table_id = aws_route_table.rt.id
  subnet_id      = aws_subnet.publicSubnet.id
}

#Step- 6 Create security_group
resource "aws_security_group" "sg" {
  tags = {
    Name = "sg-1"
  }
  vpc_id = aws_vpc.myvpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

