resource "aws_instance" "vpc-create-public-ec2" {
  ami           = "ami-0ed11f3863410c386" # ubuntu 18.04 amd64
  instance_type = "t2.nano"
  key_name = aws_key_pair.vpc-create-generated-key.key_name
  availability_zone = aws_subnet.vpc-create-public-subnet.availability_zone

  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.vpc-create-public-ec2-ni.id
  }
}

resource "aws_eip" "vpc-create-public-eip" {
  instance = aws_instance.vpc-create-public-ec2.id
  vpc      = true
}