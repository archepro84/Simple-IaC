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


resource "aws_iam_role_policy" "code-build-with-policy-document-iam-role-policy-code-build" {
  name   = "${local.SERVICE_NAME}-iam-role-policy-code-build"
  role   = aws_iam_role.code-build-with-policy-document-iam-role.id
  policy = aws_iam_policy.code-build-with-policy-document-iam-policy-code-build-admin.policy
}

resource "aws_iam_role_policy" "code-build-with-policy-document-iam-role-policy-secrets-manager" {
  name   = "${local.SERVICE_NAME}-iam-role-policy-secrets-manager"
  role   = aws_iam_role.code-build-with-policy-document-iam-role.id
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
          {
              "Action": [
                  "secretsmanager:*",
                  "kms:DescribeKey",
                  "kms:ListAliases",
                  "kms:ListKeys",
                  "lambda:ListFunctions",
                  "rds:DescribeDBClusters",
                  "rds:DescribeDBInstances",
                  "redshift:DescribeClusters",
                  "tag:GetResources"
              ],
              "Effect": "Allow",
              "Resource": "*"
          }
    ]
}
EOF
}

resource "aws_iam_role_policy" "code-build-with-policy-document-iam-role-policy-ecr" {
  name   = "${local.SERVICE_NAME}-iam-role-policy-ecr"
  role   = aws_iam_role.code-build-with-policy-document-iam-role.id
  policy = <<EOF
{
    "Version": "2012-10-17",
        "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ecr:GetAuthorizationToken",
                "ecr:BatchCheckLayerAvailability",
                "ecr:GetDownloadUrlForLayer",
                "ecr:GetRepositoryPolicy",
                "ecr:DescribeRepositories",
                "ecr:ListImages",
                "ecr:DescribeImages",
                "ecr:BatchGetImage",
                "ecr:GetLifecyclePolicy",
                "ecr:GetLifecyclePolicyPreview",
                "ecr:ListTagsForResource",
                "ecr:DescribeImageScanFindings",
                "ecr:InitiateLayerUpload",
                "ecr:UploadLayerPart",
                "ecr:CompleteLayerUpload",
                "ecr:PutImage"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_instance_profile" "code-build-with-policy-document-iam-instance-profile" {
  name = "${local.SERVICE_NAME}-iam-instance-profile"
  role = aws_iam_role.code-build-with-policy-document-iam-role.name
}
