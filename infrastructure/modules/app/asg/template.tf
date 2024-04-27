resource "aws_launch_template" "launch_template" {
  name = var.launch_template_name


  image_id = data.aws_ami.linux_ami.image_id

  instance_type = "t2.micro"
  depends_on    = [data.aws_ami.linux_ami]


  monitoring {
    enabled = true
  }

  network_interfaces {
    associate_public_ip_address = false
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
