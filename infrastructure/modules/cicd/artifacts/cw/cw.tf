resource "aws_cloudwatch_log_group" "log_group" {
  name = "codebuild-loggroup"

  tags = {
    Environment = "Dev"
  }
}

resource "aws_cloudwatch_log_stream" "log_stream" {
  name           = "codebuild-logstream"
  log_group_name = aws_cloudwatch_log_group.log_group.name
}
