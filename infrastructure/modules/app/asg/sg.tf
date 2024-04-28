resource "aws_security_group" "ec2_sg" {
  name = "zero-downtime-deployment-ec2-sg"
  #   ingress {
  #     from_port       = 80
  #     to_port         = 80
  #     protocol        = "tcp"
  #     security_groups = [var.alb_sg_id]
  #   }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
