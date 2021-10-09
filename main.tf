resource "random_string" "random" {
  length           = 12
  special          = false
  #override_special = "/@£$"
}

resource "digitalocean_ssh_key" "rootkey" {
  name = "rootkey"
  #public_key = file("/opt/terraform/id_rsa.pub")
  #public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCiNdgoKnX13LipucnX1jXk/YFvmtgTlHmDGqvJZ9Pfv+EIKt3LlCdYIMSle6+QgGK1QcmNLqSUaACIsRvUAWUBC+yS5mY3GiC6p9I/GAdNdg5omVtA0dabsgcbQixnrSQqxvq+WgtmEMBXmeKM8fmIZ4nyRH2VD49r/iC+Bnc9b7uDafnff37wZi6bqG55wVWOLA88mZvqYAzcq5ccd1wV014zTVCeEY1tEgM4u+jYw1W/fc0U2gxViaJ0fPFrBxdKUXPUgNi6VTZbDb0C0cE4GVAstOl5jBsqBvdnQykHpOjqfON2KV2g2WBdQRaM2OWOoJVOaEhZzy8Z2rLI+W55"
}

resource "digitalocean_droplet" "droplet-1" {
  image              = data.digitalocean_image.do_image.id
  name               = var.do_name
  region             = var.do_region
  size               = var.do_size
  backups            = var.do_backup
  resize_disk        = var.do_resize_disk
  monitoring         = var.do_monitoring
  ipv6               = var.do_ipv6
  vpc_uuid           = var.do_vpc_uuid == "" ? null : var.do_vpc_uuid
  ssh_keys           = [digitalocean_ssh_key.rootkey.fingerprint]

provisioner "remote-exec" {
     inline = [
        "sed -i '/^PasswordAuthentication/s/^.*$/PasswordAuthentication yes/' /etc/ssh/sshd_config",
        "yum install -y sshpass",
        "echo ${random_string.random.id} | passwd --stdin root",
        "systemctl restart sshd"
     ]
    connection {
      type        = "ssh"
      user        = "root"
      private_key = file("/opt/terraform/id_rsa")
      host        = self.ipv4_address
    }
  }
}

/*resource "digitalocean_volume" "volume-droplet-1" {
  region                  = var.do_region
  #name                    = join("", ["Volume", var.do_name])
  name = "volume-droplet-1"
  size                    = 100
  initial_filesystem_type = "xfs"
  description             = "add more volume to droplet"
}

resource "digitalocean_volume_attachment" "droplet-atach" {
  droplet_id = digitalocean_droplet.droplet-1.id
  volume_id  = digitalocean_volume.volume-droplet-1.id
}*/
