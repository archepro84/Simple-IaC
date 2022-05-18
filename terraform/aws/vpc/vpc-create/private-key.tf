resource "tls_private_key" "vpc-create-tls-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "vpc-create-generated-key" {
  key_name   = local.KEY_NAME
  public_key = tls_private_key.vpc-create-tls-key.public_key_openssh
}

resource "local_file" "vpc-create-pem-file" {
  filename          = "./${local.KEY_NAME}.pem"
  file_permission   = "400"
  sensitive_content = tls_private_key.vpc-create-tls-key.private_key_pem
}

output "key_name" {
  value       = aws_key_pair.vpc-create-generated-key.key_name
  description = "keypair key file name"
}

output "public_key" {
  value       = aws_key_pair.vpc-create-generated-key.public_key
  description = "keypair public key"
}