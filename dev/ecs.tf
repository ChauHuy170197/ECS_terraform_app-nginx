
module "ecs" {
  source = "../module/ecs"
  name   = var.cluster_name
  auto_scaling_group_arn = module.autoscaling.autoscaling_group_arn
  container_definitions  = file("container-def.json")
  target_group_arn       = module.alb_target_group.target_group_arn
  container_name         = "test-ecs"
}
