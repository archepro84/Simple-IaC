#resource "aws_lb" "ecs-elb-lb" {
#  name               = "${local.SERVICE_NAME}-lb"
#  internal           = false
#  load_balancer_type = "application"
#  security_groups    = [aws_security_group.ecs-elb-security-group-elb.id]
#  subnets            = [aws_subnet.ecs-elb-subnet-one.id, aws_subnet.ecs-elb-subnet-two.id]
#
#  #  enable_deletion_protection = true
#
#  tags = {
#    Name = "${local.SERVICE_NAME}-lb"
#  }
#
#}
#
