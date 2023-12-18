provider "aws" {
  region = "us-east-1"
}

resource "null_resource" "apply_kubernetes_resources" {
  provisioner "local-exec" {
    command     = "kubectl apply -f /EKS/servicelb.yml"
    working_dir = path.module
  }

  provisioner "local-exec" {
    command     = "kubectl apply -f /EKS/deployment1.yml"
    working_dir = path.module
  }

  provisioner "local-exec" {
    command     = "kubectl apply -f /EKS/deployment2.yml"
    working_dir = path.module
  }

  provisioner "local-exec" {
    command     = "kubectl apply -f /EKS/deployment3.yml"
    working_dir = path.module
  }
}
