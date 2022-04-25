resource "aws_db_parameter_group" "rds-create-parameter-group" {
  name        = "rds-create-parameter-group"
  description = "terraform rds-create parameter group"
  family      = "mysql5.7"

  parameter {
    name  = "character_set_server"
    value = "utf8"
  }
  parameter {
    name  = "character_set_client"
    value = "utf8"
  }
}

resource "aws_db_instance" "rds-create-rds" {
  name = "rds-create-rds"

  engine         = "mysql"
  engine_version = "5.7"
  instance_class = "db.t3.micro" # Free tier

  username = local.DB_USER_NAME
  password = local.DB_USER_PASS

  allocated_storage     = 20 # default storage size
  max_allocated_storage = 100

  parameter_group_name = aws_db_parameter_group.rds-create-parameter-group.id
  skip_final_snapshot  = true
  availability_zone    = "${local.REGION}a"

  security_group_names = [aws_security_group.rds-create-security-group.id]

  tags = {
    Name = "rds-create-rds"
  }
}