resource "aws_iam_policy_attachment" "test-attach" {
  name       = var.name
  roles      = var.roles
  policy_arn = var.policy_arn
}
