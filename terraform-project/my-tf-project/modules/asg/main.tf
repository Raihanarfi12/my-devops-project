resource "aws_autoscaling_group" "my-asg" {
    name = var.asg_name
    min_size = var.min_size
    max_size = var.max_size
}