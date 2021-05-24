resource "helm_release" "spark-operator" {
  chart = "spark-operator"
  name = "spark-operator"
  repository = "https://googlecloudplatform.github.io/spark-on-k8s-operator"
  namespace = "spark"
  create_namespace = true
  set {
    name = "sparkJobNamespace"
    value = "spark"
  }
  set {
    name = "image.tag"
    value = "v1beta2-1.2.3-3.1.1"
  }
}