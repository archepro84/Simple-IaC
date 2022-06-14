# Docs: https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_variables.html#policy-vars-intro

data "aws_iam_policy_document" "code-build-with-policy-document-iam-policy-document-iam" {
  statement {
    effect    = "Allow"
    actions   = [
      "iam:AttachGroupPolicy",
      "iam:AttachUserPolicy",
      "iam:CreatePolicy",
      "iam:ListAttachedGroupPolicies",
      "iam:ListAttachedUserPolicies",
      "iam:ListGroups",
      "iam:ListPolicies",
      "iam:ListUsers"
    ]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "code-build-with-policy-document-iam-policy-document-code-build-admin" {
  statement {
    effect    = "Allow"
    actions   = [
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
    ]
    resources = ["*"]
  }

  statement {
    effect    = "Allow"
    actions   = [
      "logs:DeleteLogGroup"
    ]
    resources = ["arn:aws:logs:*:*:log-group:/aws/codebuild/*:log-stream:*"]
  }
}

data "aws_iam_policy_document" "code-build-with-policy-document-iam-policy-document-secrets-manager" {
  statement {
    effect    = "Allow"
    actions   = [
      "secretsmanager:*",
      "kms:DescribeKey",
      "kms:ListAliases",
      "kms:ListKeys",
      "lambda:ListFunctions",
      "rds:DescribeDBClusters",
      "rds:DescribeDBInstances",
      "redshift:DescribeClusters",
      "tag:GetResources"
    ]
    resources = ["*"]
  }
}


resource "aws_iam_policy" "code-build-with-policy-document-iam-policy-code-build-admin" {
  name   = "${local.SERVICE_NAME}-iam-policy-code-build-admin"
  policy = data.aws_iam_policy_document.code-build-with-policy-document-iam-policy-document-code-build-admin.json
}

resource "aws_iam_policy" "code-build-with-policy-document-iam-policy-iam" {
  name   = "${local.SERVICE_NAME}-iam-policy-iam"
  policy = data.aws_iam_policy_document.code-build-with-policy-document-iam-policy-document-iam.json
}

resource "aws_iam_policy" "code-build-with-policy-document-iam-policy-secrets-manager" {
  name   = "${local.SERVICE_NAME}-iam-policy-secrets-manager"
  policy = data.aws_iam_policy_document.code-build-with-policy-document-iam-policy-document-secrets-manager.json
}


#output "iam-policy-code-build-admin" {
#  value       = aws_iam_policy.code-build-with-policy-document-iam-policy-code-build-admin.policy
#  description = "iam policy policy with code build admin policy"
#}
#output "iam-policy-iam" {
#  value       = aws_iam_policy.code-build-with-policy-document-iam-policy-iam.policy
#  description = "iam policy policy with iam"
#}
#output "iam-policy-secrets-manager" {
#  value       = aws_iam_policy.code-build-with-policy-document-iam-policy-secrets-manager.policy
#  description = "iam policy policy with secrets manager"
#}