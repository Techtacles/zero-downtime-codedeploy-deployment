resource "aws_autoscaling_group" "asg" {
  desired_capacity   = 1
  max_size           = 2
  min_size           = 1
  availability_zones = ["us-east-1a", "us-east-1b"]
  depends_on         = [aws_launch_template.launch_template]

  launch_template {
    id      = aws_launch_template.launch_template.id
    version = aws_launch_template.launch_template.latest_version
  }

  target_group_arns = [var.tg_arn]
}

# resource "aws_autoscaling_attachment" "asg_alb_attachment" {
#   autoscaling_group_name = aws_autoscaling_group.asg.id
#   lb_target_group_arn    = var.tg_arn
# }
