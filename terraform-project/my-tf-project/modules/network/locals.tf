locals {
  public_subnet_ids = [
    for k, subnet in var.subnets : aws_subnet.my-subnets[k].id if subnet.type == "public"
  ]
  private_subnet_ids = [
    for k, subnet in var.subnets : aws_subnet.my-subnets[k].id if subnet.type == "private"
  ]
}
