data "aws_ami" "linux_ami" {
  most_recent = true

  filter {
    name   = "image-id"
    values = toset(["ami-04e5276ebb8451442"])
  }
}
