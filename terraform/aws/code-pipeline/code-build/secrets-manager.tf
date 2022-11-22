data "aws_secretsmanager_secret" "secrets" {
  name = "Simple-IaC-Secrets"
}

data "aws_secretsmanager_secret_version" "current" {
  secret_id = data.aws_secretsmanager_secret.secrets.id
}