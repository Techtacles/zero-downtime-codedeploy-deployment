
output "log_group" {
  value = aws_cloudwatch_log_group.log_group.name

}
output "log_stream" {
  value = aws_cloudwatch_log_stream.log_stream.name

}
