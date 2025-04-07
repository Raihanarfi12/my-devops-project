variable "vpc_cidr_block" {
  type = string
  default = "10.0.0.0/16"
}
variable "subnets" {
  type = map(object({
    cidr_block = string
    availability_zone = string
    is_map_public_ip_on_launch = bool
  }))
  default = {
    "my-pub-subnet-1" = {
        cidr_block = "10.0.1.0/24"
        availability_zone = "us-east-1a"
        is_map_public_ip_on_launch = true   
    }
    "my-pub-subnet-2" = {
        cidr_block = "10.0.2.0/24"
        availability_zone = "us-east-1b"
        is_map_public_ip_on_launch = false   
    }
    "my-priv-subnet-1" = {
        cidr_block = "10.0.3.0/24"
        availability_zone = "us-east-1a"
        is_map_public_ip_on_launch = false
    }
    "my-priv-subnet-2" = {
        cidr_block = "10.0.4.0/24"
        availability_zone = "us-east-1b"
        is_map_public_ip_on_launch = false
    }
    "db-subnet-1" = {
        cidr_block = "10.0.5.0/24"
        availability_zone = "us-east-1a"
        is_map_public_ip_on_launch = false
    }
    "db-subnet-2" = {
        cidr_block = "10.0.6.0/24"
        availability_zone = "us-east-1b"
        is_map_public_ip_on_launch = false
    }
  }
}