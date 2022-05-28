resource "aws_efs_file_system" "efs-create-efs" {
  creation_token   = "${local.SERVICE_NAME}-efs"
  encrypted        = true
  performance_mode = "generalPurpose"
  throughput_mode  = "bursting"

  tags = {
    Name = "${local.SERVICE_NAME}-efs"
  }
}