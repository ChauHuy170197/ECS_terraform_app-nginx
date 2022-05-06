module "alb_ecs" {
    source = "../module/alb"
    vpc_id = module.vpc.vpc_id
    subnets = [module.public_subnet_01.id, module.public_subnet_02.id]
    name   = "alb-ecs"
    load_balancer_type = "application"
    internal           = "false" 
}

module "alb_target_group" {
    source = "../module/alb/target_group_alb"
    name   = "alb-target-group"
    vpc_id = module.vpc.vpc_id
    port   = "80"
    protocol = "HTTP"
    target_type = "instance"
}

module "alb_listener" {
  source = "../module/alb/web_listener"
  load_balancer_arn = module.alb_ecs.alb_ecs_arn
  port              = "80"
  protocol          = "HTTP"
  type             = "forward"
  target_group_arn = module.alb_target_group.target_group_arn
  
}

module "key_pair" {
  source     = "../module/key_pair"
  key_name   = "bastion"
  public_key = var.public_key
  tags = {
    Name = "bastion"
  }
}

module "ecs_lc" {
  source = "../module/alb/asg"
  name   = "test_ecs"
  vpc_id = module.vpc.vpc_id
  instance_type = "t2.micro"
  key_name      = module.key_pair.id
  cluster_name = var.cluster_name
  iam_instance_profile = module.instance_profile.instance_profile_name
}

module "autoscaling" {
  source = "../module/alb/autoscaling"
  launch_configuration = module.ecs_lc.ecs_lc_name
  min_size                  = 1
  max_size                  = 3
  desired_capacity          = 2
  health_check_type         = "ELB"
  vpc_zone_identifier       = [module.public_subnet_01.id, module.public_subnet_02.id]
  target_group_arns         = [module.alb_target_group.target_group_arn]
}
