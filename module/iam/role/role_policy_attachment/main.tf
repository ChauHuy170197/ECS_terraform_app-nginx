resource "aws_iam_role_policy_attachment" "this" {
  for_each   = toset(var.policy_attachments)
  role       = var.role
  policy_arn = each.value
}
