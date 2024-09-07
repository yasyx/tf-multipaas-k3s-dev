module "vm" {
  source = "../modules/vm"
}

module "k3s" {
  source     = "../modules/k3s"
  private_ip = module.vm.k3server.ipv4
}

module "argocd" {
  source = "../modules/helm"
  kube_config = local_sensitive_file.kubeconfig.filename
  name = "argocd"
  namespace = "argocd"
  chart = "argo-cd"
  repository = "https://argoproj.github.io/argo-helm"
}
resource "local_sensitive_file" "kubeconfig" {
  content  = module.k3s.kube_config
  filename = "${path.module}/config.yaml"
}


