resource "aws_instance" "elb-ec2-one" {
  ami               = "ami-0ed11f3863410c386" # ubuntu 18.04 amd64
  instance_type     = "t2.nano"
  key_name          = aws_key_pair.elb-generated-key.key_name
  availability_zone = aws_subnet.elb-subnet-one.availability_zone
  monitoring        = true

  user_data = file("./git-pull-project.sh")

  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.elb-ec2-one-ni.id
  }

  tags = {
    Name = "${local.SERVICE_NAME}-ec2-one"
  }
}