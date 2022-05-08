resource "aws_instance" "ec2-create-ec2" {
  ami               = "ami-063454de5fe8eba79" # ubuntu 22.04 LTS amd64
  instance_type     = "t2.nano"
  key_name          = aws_key_pair.ec2-create-generated-key.key_name
  availability_zone = aws_subnet.ec2-create-subnet.availability_zone
  monitoring        = true

  user_data = <<EOF
# Update linux apt package manager
sudo apt-get update

# install curl, git package
sudo apt-get install curl git -y
EOF

  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.ec2-create-ec2-ni.id
  }

  tags = {
    Name = "${local.SERVICE_NAME}-ec2"
  }
}

resource "aws_eip" "ec2-create-eip" {
  instance = aws_instance.ec2-create-ec2.id
}

output "ssh-command" {
  value = "ssh -i ${local_file.ec2-create-pem-file.filename} ubuntu@${aws_eip.ec2-create-eip.public_ip}"
}