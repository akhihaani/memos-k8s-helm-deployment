variable "tags" {
  type = map(string)
}

variable "region" {
  type = string
}

variable "memos_private_subnet" {
  type = list(string)
}