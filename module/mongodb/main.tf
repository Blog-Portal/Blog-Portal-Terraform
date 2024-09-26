resource "kubernetes_deployment" "mongodb" {
  metadata {
    name      = "mongodb"
    namespace = var.namespace
    labels = {
      app = "mongodb"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "mongodb"
      }
    }

    template {
      metadata {
        labels = {
          app = "mongodb"
        }
      }

      spec {
        container {
          name  = "mongodb"
          image = "mongo:latest"

          port {
            container_port = 27017
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "mongodb" {
  metadata {
    name      = var.mongodb_service_name
    namespace = var.namespace
    labels = {
      app = "mongodb"
    }
  }

  spec {
    selector = {
      app = "mongodb"
    }

    port {
      port        = 27017
      target_port = 27017
    }

    type = "ClusterIP"
  }
}
