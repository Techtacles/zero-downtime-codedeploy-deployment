resource "aws_iam_instance_profile" "test_profile" {
  name = "zero-downtime-deployment-instance-profile"
  role = aws_iam_role.ec2_role.name
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}
data "aws_iam_policy_document" "ec2_policy_doc" {
  statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = ["*"]
  }

  statement {
    effect = "Allow"

    actions = [
      "s3:*",
      "codedeploy:*"
      
    ]

    resources = ["*"]
  }

}
resource "aws_iam_role" "ec2_role" {
  name               = "zero-downtime-deployment-ec2-role"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy" "ec2_policy" {
  role   = aws_iam_role.ec2_role.name
  policy = data.aws_iam_policy_document.ec2_policy_doc.json
}
