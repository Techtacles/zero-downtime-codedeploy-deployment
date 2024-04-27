variable "codepipeline_name" {
  type        = string
  description = "Codepipeline name"

}
variable "repository_name" {
  type        = string
  description = "Value for codecommit repository name"

}
# variable "artifact_bucket" {
#   type        = string
#   description = "Codepipeline artifact bucket"

# }
variable "codebuild_project_name" {
  type        = string
  description = "Codebuild project name"

}
variable "codedeploy_application_name" {
  type        = string
  description = "Application name for codedeploy"

}
variable "deployment_group_name" {
  type        = string
  description = "Deployment group name"

}
variable "repo_arn" {
  type        = string
  description = "ARN for codecommit repo"

}
