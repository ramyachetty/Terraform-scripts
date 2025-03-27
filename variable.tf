#varibles are connected with main.tf
variable "ami-id" {
  type    = string
  default = "ami-08f9a9c699d2ab3f9"
}

variable "instance-type" {
  type    = string
  default = "t2.medium"
}

variable "az" {
  type    = string
  default = "eu-west-1b"
}

variable "vs" {
  type    = number
  default = 10
}


