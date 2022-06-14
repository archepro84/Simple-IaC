resource "aws_iam_role" "code-build-with-policy-document-iam-role" {
  name = "${local.SERVICE_NAME}-iam-role"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Principal": {
                "Service": [
                    "codecommit.amazonaws.com",
                    "codebuild.amazonaws.com",
                    "codedeploy.amazonaws.com",
                    "codepipeline.amazonaws.com"
                ]
            },
            "Action": [
                "sts:AssumeRole"
            ]
        }
    ]
}
EOF
}


resource "aws_iam_role_policy" "code-build-with-policy-document-iam-role-policy-code-build-admin" {
  name   = "${local.SERVICE_NAME}-iam-role-policy-code-build-admin"
  role   = aws_iam_role.code-build-with-policy-document-iam-role.id
  policy = aws_iam_policy.code-build-with-policy-document-iam-policy-code-build-admin.policy
}

resource "aws_iam_role_policy" "code-build-with-policy-document-iam-role-policy-iam" {
  name   = "${local.SERVICE_NAME}-iam-role-policy-iam"
  role   = aws_iam_role.code-build-with-policy-document-iam-role.id
  policy = aws_iam_policy.code-build-with-policy-document-iam-policy-secrets-manager.policy
}

resource "aws_iam_role_policy" "code-build-with-policy-document-iam-role-policy-secrets-manager" {
  name   = "${local.SERVICE_NAME}-iam-role-policy-secrets-manager"
  role   = aws_iam_role.code-build-with-policy-document-iam-role.id
  policy = aws_iam_policy.code-build-with-policy-document-iam-policy-secrets-manager.policy
}


resource "aws_iam_instance_profile" "code-build-with-policy-document-iam-instance-profile" {
  name = "${local.SERVICE_NAME}-iam-instance-profile"
  role = aws_iam_role.code-build-with-policy-document-iam-role.name
}
