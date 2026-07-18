variable "tags" {
  type = map(string)
}

variable "region" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}