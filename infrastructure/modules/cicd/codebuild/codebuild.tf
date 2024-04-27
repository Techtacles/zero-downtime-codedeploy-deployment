module "codebuild_artifact_bucket" {
  source          = "../artifacts/s3"
  artifact_bucket = "zero-downtime-deployment-cb-artifact-bucket"

}

module "codebuild_logs" {
  source = "../artifacts/cw"

}

resource "aws_codebuild_project" "codebuild_project" {
  name          = var.codebuild_project
  build_timeout = 5
  service_role  = aws_iam_role.codebuild_role.arn
  depends_on    = [module.codebuild_artifact_bucket, module.codebuild_logs]

  artifacts {
    type = "S3"
    name = "artifact.jar"
    location = module.codebuild_artifact_bucket.s3_bucket_id
  }

  cache {
    type     = "S3"
    location = module.codebuild_artifact_bucket.s3_bucket
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/amazonlinux2-x86_64-standard:4.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"


  }

  logs_config {
    cloudwatch_logs {
      group_name  = module.codebuild_logs.log_group
      stream_name = module.codebuild_logs.log_stream
    }

    s3_logs {
      status   = "ENABLED"
      location = "${module.codebuild_artifact_bucket.s3_bucket_id}/log"
    }
  }

  source {
    type      = "CODECOMMIT"
    buildspec = file("${path.root}/../scripts/buildspec.yml")
    location  = var.codecommit_repo_name
  }

  tags = {
    Environment = "Dev"
  }
}
