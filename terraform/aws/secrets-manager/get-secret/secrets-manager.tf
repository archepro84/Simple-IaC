# name과 일치하는 AWS Secrets Manager의 Secret을 가져옵니다.
# docs: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret
data "aws_secretsmanager_secret" "secrets" {
  name = var.aws_secrets_name
}


data "aws_secretsmanager_secret_version" "current" {
  secret_id = data.aws_secretsmanager_secret.secrets.id
}

#output "aws_secretsmanager_secret" {
#  value = data.aws_secretsmanager_secret.secrets
#
#  sensitive = true # Sensitive한 값이더라도 출력합니다.
#}
#
#output "aws_secretsmanager_secret_version" {
#  value = data.aws_secretsmanager_secret_version.current
#
#  sensitive = true # Sensitive한 값이더라도 출력합니다.
#}


# Secrets Manager의 Key를 Json 파일로 출력합니다.
resource "local_file" "secrets" {
  filename          = "./secrets.json"
  file_permission   = "400"
  sensitive_content = data.aws_secretsmanager_secret_version.current.secret_string
}