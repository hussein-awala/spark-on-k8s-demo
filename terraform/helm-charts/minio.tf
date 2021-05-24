resource "kubernetes_secret" "minio-secret" {
  metadata {
    name = "minio"
  }
  data = {
    access-key = "test-minio"
    secret-key = "test-minio"
  }
}

resource "helm_release" "minio" {
  chart = "minio"
  name = "minio"
  repository = "https://charts.bitnami.com/bitnami"
  set {
    name = "global.minio.existingSecret"
    value = "minio"
  }
  set_sensitive {
    name = "accessKey.password"
    value = kubernetes_secret.minio-secret.data.access-key
  }
  set_sensitive {
    name = "secretKey.password"
    value = kubernetes_secret.minio-secret.data.secret-key
  }
}

resource "kubernetes_pod" "minio-bucket" {
  depends_on = [helm_release.minio]
  metadata {
    name = "minio-bucket"
  }
  spec {
    container {
      name = "createbuckets"
      image = "minio/mc"
      command = ["/bin/sh", "-c"]
      args = [
        <<EOF
          /usr/bin/mc config host add minio http://minio:9000 ${kubernetes_secret.minio-secret.data.access-key} ${kubernetes_secret.minio-secret.data.secret-key};
          /usr/bin/mc mb minio/${var.bucket-name};
          exit 0;
        EOF
      ]
    }
  }
}
