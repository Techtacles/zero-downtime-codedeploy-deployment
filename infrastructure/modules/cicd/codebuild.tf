resource "aws_codebuild_project" "codebuild_project" {
  name          = var.codebuild_project
  build_timeout = 5
  service_role  = aws_iam_role.codebuild_role.arn
  depends_on    = [aws_codecommit_repository.codecommit, aws_s3_bucket.artifact_bucket]

  artifacts {
    type = "NO_ARTIFACTS"
  }

  cache {
    type     = "S3"
    location = aws_s3_bucket.artifact_bucket.bucket
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/amazonlinux2-x86_64-standard:4.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"


  }

  logs_config {
    cloudwatch_logs {
      group_name  = aws_cloudwatch_log_group.log_group.name
      stream_name = aws_cloudwatch_log_stream.log_stream.name
    }

    s3_logs {
      status   = "ENABLED"
      location = "${aws_s3_bucket.artifact_bucket.id}/log"
    }
  }

  source {
    type      = "CODECOMMIT"
    buildspec = file("${path.module}/../scripts/buildspec.yml")
  }

  tags = {
    Environment = "Dev"
  }
}
