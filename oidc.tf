resource "aws_iam_openid_connect_provider" "github" {
  url = "https://token.actions.githubusercontent.com"

  client_id_list = [
    "https://github.com/${var.github_account}",
  ]

  thumbprint_list = [
    "a031c46782e6e6c662c2c87c76da9aa62ccabd8e"
  ]
}