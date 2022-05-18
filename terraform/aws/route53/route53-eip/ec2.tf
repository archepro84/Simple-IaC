resource "aws_instance" "route53-eip-ec2" {
  ami               = "ami-063454de5fe8eba79" # ubuntu 22.04 LTS amd64
  instance_type     = "t2.nano"
  key_name          = aws_key_pair.route53-eip-generated-key.key_name
  availability_zone = aws_subnet.route53-eip-subnet.availability_zone
  monitoring        = true

  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.route53-eip-ec2-ni.id
  }

  tags = {
    Name = "${local.SERVICE_NAME}-ec2"
  }
}

resource "aws_eip" "route53-eip-eip" {
  instance = aws_instance.route53-eip-ec2.id
}

output "ssh-command" {
  value = "ssh -i ${local_file.route53-eip-pem-file.filename} ubuntu@${aws_eip.route53-eip-eip.public_ip}"
}