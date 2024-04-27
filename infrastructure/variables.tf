variable "repository_name" {
  type        = string
  description = "Repository name for codecommit"

}
variable "codebuild_project" {
  type        = string
  description = "Codebuild project"

}
variable "alb_name" {
  type        = string
  description = "Name for the load balancer "

}

variable "vpc_id" {
  type        = string
  description = "The id of your vpc"

}

variable "launch_template_name" {
  type        = string
  description = "Name for the ec2 launch template"

}
variable "codedeploy_name" {
  type        = string
  description = "Name for codedeploy"

}
variable "codedeploy_deployment_group_name" {
  type        = string
  description = "Deployment group name for codedeploy"

}
variable "codepipeline_name" {
  type        = string
  description = "Name for codepipeline"

}
