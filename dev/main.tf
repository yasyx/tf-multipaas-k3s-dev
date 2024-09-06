module "vm" {
  source = "../modules/vm"
  providers = {
    
  }
}

module "k3s" {
  source = "../modules/k3s"
  private_ip = module.vm.k3server.ipv4
}


resource "local_sensitive_file" "kubeconfig" {
  content  = module.k3s.kube_config
  filename = "${path.module}/config.yaml"
}