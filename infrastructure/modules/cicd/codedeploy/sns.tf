resource "aws_sns_topic" "sns_topic" {
  name = "zero-downtime-topic"
}

resource "aws_sns_topic_subscription" "email-target" {
  topic_arn = aws_sns_topic.sns_topic.arn
  protocol  = "email"
  endpoint  = "your_email@email.com"
}
