
resource "multipass_instance" "k3server" {
  cloudinit_file = "${path.module}/files/cloudinit_file"
  name           = var.name
  cpus           = 2
  memory         = "8G"
  disk           = "60G"
  image          = "noble"
}



data "multipass_instance" "default" {
  depends_on = [multipass_instance.k3server]
  name       = var.name
}






