variable "aws_region" {
  type = string
}

variable "docker_image" {
  type = string
}

variable "server_port" {
  type    = number
  default = 25565
}