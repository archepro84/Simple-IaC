# name과 일치하는 AWS Secrets Manager의 Secret을 가져옵니다.
# docs: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret
data "aws_secretsmanager_secret" "secrets" {
  name = var.aws_secret_name
}


data "aws_secretsmanager_secret_version" "current" {
  secret_id = data.aws_secretsmanager_secret.secrets.id
}


# # Secrets Manager의 Key를 Json 파일로 출력합니다.
#resource "local_sensitive_file" "secrets" {
#  filename        = "./secrets.json"
#  content         = data.aws_secretsmanager_secret_version.current.secret_string
#  file_permission = "0400" # Linux mode
#}