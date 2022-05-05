resource "aws_lb_target_group" "elb-target-group-one" {
  name     = "${local.SERVICE_NAME}-target-group-one"
  port     = local.SERVER_PORT
  protocol = "HTTP"
  vpc_id   = aws_vpc.elb-main.id
}

resource "aws_lb_target_group_attachment" "elb-target-group-attachment-one" {
  target_group_arn = aws_lb_target_group.elb-target-group-one.arn
  target_id        = aws_instance.elb-ec2-one.id
  port             = local.SERVER_PORT
}