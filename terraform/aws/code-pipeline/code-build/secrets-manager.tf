data "aws_secretsmanager_secret" "code-build-secrets-manager-secret" {
  name = "Simple-IaC-Secrets"
}

data "aws_secretsmanager_secret_version" "current" {
  secret_id = data.aws_secretsmanager_secret.code-build-secrets-manager-secret.id
}