resource "aws_db_instance" "rds-create-rds" {
  allocated_storage    = 20 # default storage size
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro" # Free tier
  name                 = "rds-create-rds"
  username             = local.DB_USER_NAME
  password             = local.DB_USER_PASS
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}