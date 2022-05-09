resource "tls_private_key" "route53-eip-tls-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "route53-eip-generated-key" {
  key_name   = local.KEY_NAME
  public_key = tls_private_key.route53-eip-tls-key.public_key_openssh
}

resource "local_file" "route53-eip-pem-file" {
  filename          = "./${local.KEY_NAME}.pem"
  file_permission   = "400"
  sensitive_content = tls_private_key.route53-eip-tls-key.private_key_pem
}

output "key_name" {
  value       = aws_key_pair.route53-eip-generated-key.key_name
  description = "keypair key file name"
}