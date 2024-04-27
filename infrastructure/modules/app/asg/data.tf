data "aws_ami" "ubuntu_ami" {
  most_recent = true

  filter {
    name   = "image-id"
    values = toset(["ami-04b70fa74e45c3917"])
  }
}
