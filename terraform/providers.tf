provider "kubernetes" {
  config_path    = var.kubernetes-config-path
  config_context = var.kubernetes-context
}

provider "helm" {
  kubernetes {
    config_path = var.kubernetes-config-path
    config_context = var.kubernetes-context
  }
}

provider "kubernetes-alpha" {
  config_path = var.kubernetes-config-path
  config_context = var.kubernetes-context
}