module "ecs_instance_role" {
  source = "../module/iam/role"
  name   = "ecs-instance-role-test"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

module "ecs_instance_attachment" {
  source = "../module/iam/role/role_policy_attachment"
  role   = module.ecs_instance_role.role_name
  policy_attachments = [
    "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role",
  ]
}

module "instance_profile" {
  source = "../module/iam/role/instance_profile"
  role   = module.ecs_instance_role.role_name
  name   = "ecs-role-Test"
}
