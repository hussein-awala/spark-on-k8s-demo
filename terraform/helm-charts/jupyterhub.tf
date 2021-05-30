resource "helm_release" "jupyterhub" {
  chart = "jupyterhub"
  name = "jupyterhub"
  repository = "https://jupyterhub.github.io/helm-chart/"
  values = [
    file("${path.module}/jupyterhub-config.yml")
  ]
}