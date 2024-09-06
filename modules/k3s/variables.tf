variable "private_ip" {}

variable "private_key_path" {
  default = "~/.ssh/id_rsa"
}

variable "user" {
  default = "ubuntu"
}