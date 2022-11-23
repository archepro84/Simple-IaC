data "aws_secretsmanager_secret" "secrets" {
  name = var.aws_secret_name
}

data "aws_secretsmanager_secret_version" "secret_key" {
  secret_id = data.aws_secretsmanager_secret.secrets.id
}