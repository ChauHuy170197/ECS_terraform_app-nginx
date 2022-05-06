resource "aws_lb_target_group" "this" {
  name        = var.name
  port        = var.port
  protocol    = var.protocol
  target_type = var.target_type
  vpc_id      = var.vpc_id
  health_check {
        healthy_threshold   = 2
        unhealthy_threshold = 10
        timeout             = 60
        interval            = 300
        matcher             = "200,301,302"
  }
}