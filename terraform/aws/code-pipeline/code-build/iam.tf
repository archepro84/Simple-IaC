resource "aws_iam_role" "code-build-iam-role" {
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
                    "codebuild.amazonaws.com",
                    "secretsmanager.amazonaws.com"
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

resource "aws_iam_role_policy" "code-build-iam-role-policy-code-build" {
  name   = "${local.SERVICE_NAME}-iam-role-policy-code-build"
  role   = aws_iam_role.code-build-iam-role.id
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "codebuild:*",
                "codecommit:GetBranch",
                "codecommit:GetCommit",
                "codecommit:GetRepository",
                "codecommit:ListBranches",
                "codecommit:ListRepositories",
                "cloudwatch:GetMetricStatistics",
                "ec2:DescribeVpcs",
                "ec2:DescribeSecurityGroups",
                "ec2:DescribeSubnets",
                "ecr:DescribeRepositories",
                "ecr:ListImages",
                "elasticfilesystem:DescribeFileSystems",
                "events:DeleteRule",
                "events:DescribeRule",
                "events:DisableRule",
                "events:EnableRule",
                "events:ListTargetsByRule",
                "events:ListRuleNamesByTarget",
                "events:PutRule",
                "events:PutTargets",
                "events:RemoveTargets",
                "logs:GetLogEvents",
                "s3:GetBucketLocation",
                "s3:ListAllMyBuckets"
            ],
            "Effect": "Allow",
            "Resource": "*"
        },
        {
            "Action": [
                "logs:DeleteLogGroup"
            ],
            "Effect": "Allow",
            "Resource": "arn:aws:logs:*:*:log-group:/aws/codebuild/*:log-stream:*"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy" "code-build-iam-role-policy-secrets-manager" {
  name   = "${local.SERVICE_NAME}-iam-role-policy-secrets-manager"
  role   = aws_iam_role.code-build-iam-role.id
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

resource "aws_iam_role_policy" "code-build-iam-role-policy-ecr" {
  name   = "${local.SERVICE_NAME}-iam-role-policy-ecr"
  role   = aws_iam_role.code-build-iam-role.id
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

resource "aws_iam_instance_profile" "code-build-iam-instance-profile" {
  name = "${local.SERVICE_NAME}-iam-instance-profile"
  role = aws_iam_role.code-build-iam-role.id
}
