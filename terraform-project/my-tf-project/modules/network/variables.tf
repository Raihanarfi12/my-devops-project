variable "vpc_cidr_block" {
  type = string
  default = "10.0.0.0/16"
}
variable "subnets" {
  type = map(object({
    cidr_block = string
    availability_zone = string
    type = string
  }))
  default = {
    "my-pub-subnet-1" = {
        cidr_block = "10.0.1.0/24"
        availability_zone = "us-east-1a"
        type = "public"
    }
    "my-pub-subnet-2" = {
        cidr_block = "10.0.2.0/24"
        availability_zone = "us-east-1b"
        type = "public"   
    }
    "my-priv-subnet-1" = {
        cidr_block = "10.0.3.0/24"
        availability_zone = "us-east-1a"
        type = "private"
    }
    "my-priv-subnet-2" = {
        cidr_block = "10.0.4.0/24"
        availability_zone = "us-east-1b"
        type = "private"
    }
    "db-subnet-1" = {
        cidr_block = "10.0.5.0/24"
        availability_zone = "us-east-1a"
        type = "private"
    }
    "db-subnet-2" = {
        cidr_block = "10.0.6.0/24"
        availability_zone = "us-east-1b"
        type = "private"
    }
  }
  validation {
    condition = alltrue([
      for subnet in values(var.subnets) : subnet.type == "private" || subnet.type == "public"
    ])
    error_message = "Each subnet must have type 'private' or 'public'."
  }
}