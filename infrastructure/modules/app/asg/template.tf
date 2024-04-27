resource "aws_launch_template" "launch_template" {
  name = var.launch_template_name


  image_id = data.aws_ami.ubuntu_ami.image_id

  instance_type = "t2.micro"
  depends_on    = [data.aws_ami.ubuntu_ami]


  monitoring {
    enabled = true
  }

  iam_instance_profile {
    name = aws_iam_instance_profile.test_profile.name
  }


  tag_specifications {
    resource_type = "instance"

    tags = {
      Environment = "Dev"
    }
  }
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  user_data = filebase64("${path.root}/../scripts/userdata.sh")
}
