#GITHUB_ACCESS_TOKEN

resource "aws_codebuild_project" "code-build-codebuild-project"{
  name = "${local.SERVICE_NAME}-codebuild-project"
  description = "${local.SERVICE_NAME}-codebuild-project-description"
  service_role = aws_iam_role.code-build-iam-role.arn

  artifacts {
    type = "NO_ARTIFACTS"
  }
}