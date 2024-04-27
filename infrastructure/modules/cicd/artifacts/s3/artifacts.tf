resource "aws_s3_bucket" "artifact_bucket" {
  bucket = var.artifact_bucket
}

resource "aws_s3_bucket_acl" "acl" {
  bucket = aws_s3_bucket.artifact_bucket.id
  acl    = "private"
}
