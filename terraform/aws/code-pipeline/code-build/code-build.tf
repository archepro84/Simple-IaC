resource "aws_codebuild_project" "code-build-codebuild-project" {
  name         = "${var.service_name}-codebuild-project"
  description  = "${var.service_name}-codebuild-project-description"
  service_role = aws_iam_role.code-build-iam-role.arn

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:1.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
  }

  source {
    buildspec       = "${path.module}/build-spec.yml"
    type            = "GITHUB"
    location        = "https://github.com/archepro84/prac-docker.git"
    git_clone_depth = 1
  }
  source_version = "master"

  tags = {
    Name = "${var.service_name}-codebuild-project"
  }
}

resource "aws_codebuild_source_credential" "code-build-codebuild-source-credential" {
  auth_type   = "PERSONAL_ACCESS_TOKEN"
  server_type = "GITHUB"
  token       = jsondecode(data.aws_secretsmanager_secret_version.current.secret_string)["GITHUB_ACCESS_TOKEN"]
}