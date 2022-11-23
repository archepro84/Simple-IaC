# get-secret

## 개요

해당 프로젝트는 AWS SecretsManager에 존재하는 Secret Key를 가져와 출력하기 위해 작성되었습니다.  
`Simple-IaC.get-secret.auto.tfvars`파일 `aws_secret_name` 변수에 **Secret Key Name** 또는 **ARN**을 삽입하여 원하는 Secret Key를 사용할 수 있습니다.

## 설명하기
- AWS Secret Key는 Sensitive한 값이기 때문에 Terraform의 `output`으로 출력하더라도 정상적인 결과값이 나오지 않습니다.
- 원하는 AWS Secret Key의 모든 Key Value를 해당 폴더에 `secrets.json`파일로 출력합니다. 
- Terraform의 Sensitive한 파일을 만드는 과거 문법인 Resource `local_file`을 `local_sensitive_file`로 변경하였습니다. 

## 사용하기
- `secrets-manager.tf` 파일의 `local_sensitive_file` Resource를 주석 해제 후 프로젝트를 실행합니다.
- 주석 해제 후 프로젝트 실행 시 Secret Key에 대한 정보가 파일로 출력됩니다. 해당하는 파일이 Git 또는 Public한 Repository에 포함되지 않도록 유의해주세요.
```shell
# Terraform의 실행 플랜을 확인할 수 있습니다.
terraform plan

# Terraform 프로젝트를 실행합니다.
terraform apply
```
