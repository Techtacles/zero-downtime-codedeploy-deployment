variable "codedeploy_name" {
  type        = string
  description = "Name for codedeploy app"

}

variable "codedeploy_deployment_group_name" {
  type        = string
  description = "Deployment group name for code deploy"

}
variable "asg" {
  type        = list(string)
  description = "This is a list of all the autoscaling groups"

}
# variable "alb_name" {
#   type = string

# }
