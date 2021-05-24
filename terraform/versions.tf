terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
    helm = {
      source = "hashicorp/helm"
      version = ">= 2.1.0"
    }
    minio = {
      source = "rienafairefr/minio"
      version = "1.1.1"
    }
  }
  required_version = ">=0.15"
}