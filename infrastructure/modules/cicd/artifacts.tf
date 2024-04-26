resource "aws_s3_bucket" "artifact_bucket" {
  bucket = var.codebuild_artifact_bucket
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.artifact_bucket.id
  acl    = "private"
}
