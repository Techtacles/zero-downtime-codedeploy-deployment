resource "aws_autoscaling_group" "asg" {
  desired_capacity = 1
  max_size         = 2
  min_size         = 1
  depends_on       = [aws_launch_template.launch_template]

  launch_template {
    id      = aws_launch_template.launch_template.id
    version = "$Latest"
  }
}

resource "aws_autoscaling_attachment" "asg_alb_attachment" {
  autoscaling_group_name = aws_autoscaling_group.asg.id
  elb                    = var.alb_id
}
