resource "aws_codecommit_repository" "lambdaautho-code" {
  repository_name = "dockerfile-hub"
  description     = "base image for ecr"
}