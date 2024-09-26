resource "kubernetes_deployment" "spring_boot_k8s" {
  metadata {
    name      = "spring-boot-k8s"
    namespace = var.namespace
    labels = {
      app = "spring-boot-k8s"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "spring-boot-k8s"
      }
    }

    template {
      metadata {
        labels = {
          app = "spring-boot-k8s"
        }
      }

      spec {
        container {
          name              = "spring-boot-k8s"
          image             = var.backend_image
          image_pull_policy = "Always"

          port {
            container_port = 8080
          }

          env {
            name  = "MONGODB_HOST"
            value = var.mongodb_service_name
          }

          env {
            name  = "MONGODB_PORT"
            value = "27017"
          }

          env {
            name  = "ADMIN_EMAIL"
            value = var.admin_email
          }

          env {
            name  = "ADMIN_PASSWORD"
            value = var.admin_password
          }

          env {
            name  = "ADMIN_FIRST_NAME"
            value = var.admin_first_name
          }

          env {
            name  = "ADMIN_LAST_NAME"
            value = var.admin_last_name
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "spring_boot_k8s_service" {
  metadata {
    name      = var.springboot_service_name
    namespace = var.namespace
    labels = {
      app = "spring-boot-k8s"
    }
  }

  spec {
    selector = {
      app = "spring-boot-k8s"
    }

    port {
      protocol    = "TCP"
      port        = 8080
      target_port = 8080
    }
  }
}
