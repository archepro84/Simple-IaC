resource "aws_lb_listener" "elb-lb-listener-http" {
  load_balancer_arn = aws_lb.elb-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"

    forward {
      target_group {
        arn    = aws_lb_target_group.elb-target-group-one.arn
        weight = 1
      }

      target_group {
        arn    = aws_lb_target_group.elb-target-group-two.arn
        weight = 1
      }
    }
  }
}

#resource "aws_lb_listener_rule" "elb-lb-listener-http-rule" {
#  listener_arn = aws_lb_listener.elb-lb-listener-http.arn
#  priority     = 100
#
#  action {
#    type = "forward"
#    forward {
#      target_group {
#        arn    = aws_lb_target_group.elb-target-group-one.arn
#        weight = 1
#      }
#
#      target_group {
#        arn    = aws_lb_target_group.elb-target-group-two.arn
#        weight = 1
#      }
#    }
#  }
#
#  condition {
#    host_header {
#      values = ["${local.ROUTE53_URI}"]
#    }
#  }
#}