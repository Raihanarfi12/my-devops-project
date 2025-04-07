resource "aws_lb" "my-lb" {
  name               = var.lb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = [for subnet in aws_subnet.public : subnet.id]

  enable_deletion_protection = true

  access_logs {
    bucket  = aws_s3_bucket.lb_logs.id
    prefix  = "alb-logs"
    enabled = var.is_log_enabled
  }

  tags = {
    Environment = "development"
  }
}

resource "random_id" "alb_logs_id" {
  byte_length = 4
}

resource "aws_s3_bucket" "alb_logs" {
  count = var.is_log_enabled ? 1:0
  bucket = "my-alb-logs-${random_id.alb_logs_id.hex}"
  tags = {
    Name = "ALB logs"
    ALB = aws_lb.my-lb.name
  }
}