variable "launch_template_name" {
  type        = string
  description = "Set the name of your launch template"

}
variable "tg_arn" {
  type        = string
  description = "ARN for the Target Group"

}
variable "alb_sg_id" {
  type        = string
  description = "SG ID for the ALB"

}
