output "alb_id" {
  value = aws_lb.alb.id

}
output "alb_name" {
  value = aws_lb.alb.name

}

output "tg_id" {
  value = aws_lb_target_group.target_group.id

}


output "tg_arn" {
  value = aws_lb_target_group.target_group.arn

}
