variable "kubernetes-config-path" {
  type = string
  default = "~/.kube/config"
}

variable "kubernetes-context" {
  type = string
}

variable "bucket-name" {
  type = string
  default = "spark"
}
