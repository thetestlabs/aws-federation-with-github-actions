resource "aws_iam_role" "ExampleGithubOidcRole" {
  name = "ExampleGithubOidcRole"
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
  ]

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : {
      "Sid" : "ExampleGithubOidcRole",
      "Effect" : "Allow",
      "Principal" : { "Federated" : "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/token.actions.githubusercontent.com" },
      "Action" : "sts:AssumeRoleWithWebIdentity",
      "Condition" : { "StringLike" : { "token.actions.githubusercontent.com:sub" : "repo:${var.github_account}/${var.github_repo}:*" } }
    }
  })
}