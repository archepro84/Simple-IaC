resource "aws_lb_target_group" "elb-target-group-two" {
  name     = "${local.SERVICE_NAME}-target-group-two"
  port     = local.SERVER_PORT
  protocol = "HTTP"
  vpc_id   = aws_vpc.elb-main.id
}

resource "aws_lb_target_group_attachment" "elb-target-group-attachment-two" {
  target_group_arn = aws_lb_target_group.elb-target-group-two.arn
  target_id        = aws_instance.elb-ec2-two.id
  port             = local.SERVER_PORT
}