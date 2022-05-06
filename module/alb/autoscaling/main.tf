

resource "aws_autoscaling_group" "this" {
  name                      = "test-asg"
  launch_configuration      = var.launch_configuration
  min_size                  = var.min_size
  max_size                  = var.max_size
  desired_capacity          = var.desired_capacity
  health_check_type         = var.health_check_type
  health_check_grace_period = 300
  vpc_zone_identifier       = var.vpc_zone_identifier
  target_group_arns     = var.target_group_arns
  protect_from_scale_in = true
  lifecycle {
    create_before_destroy = true
  }
}
