resource "aws_codecommit_repository" "codecommit" {
  repository_name = var.repository_name
  description     = "This is a codecommit repository for the CICD"
}
