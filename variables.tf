data "digitalocean_image" "do_image" {
  slug = "redash-18-04"
  #slug = "centos-7-x64"
  #default = "ubuntu-20-10-x64"    #
  #default = "ubuntu-20-04-x64"    #
  #default = "ubuntu-18-04-x64"    # 
  #default = "ubuntu-16-04-x64"    # 
  #default = "centos-8-x64"        #
  #default = "centos-7-x64"        # 
  #default = "fedora-33-x64"       #
  #default = "fedora-32-x64"       # 
  #default = "debian-10-x64"       #
  #default = "debian-9-x64"        # 
}

variable "do_region" {
  type    = string
  default = "sgp1"
  #  - ams2, ams3
  #  - blr1
  #  - fra1
  #  - lon1
  #  - nyc1, nyc2, nyc3
  #  - sfo1, sfo2, sfo3
  #  - sgp1
  #  - tor1
}

variable "do_size" {
  type    = string
  default = "s-4vcpu-8gb"
  # DigitalOcean sizes (2021-02-01) https://slugs.do-api.dev/
  # ===============================
  #  - c-2, c-4, c-8, c-16, c-32
  #  - c2-2vcpu-4gb, c2-4vcpu-8gb, c2-8vcpu-16gb, c2-16vcpu-32gb, c2-32vcpu-64gb
  #  - gd-2vcpu-8gb, gd-4vcpu-16gb, gd-8vcpu-32gb, gd-16vcpu-64gb, gd-32vcpu-128gb, gd-40vcpu-160gb
  #  - g-2vcpu-8gb, g-4vcpu-16gb, g-8vcpu-32gb, g-16vcpu-64gb, g-32vcpu-128gb, g-40vcpu-160gb
  #  - m3-2vcpu-16gb, m3-4vcpu-32gb, m3-8vcpu-64gb, m3-16vcpu-128gb, m3-24vcpu-192gb, m3-32vcpu-256gb
  #  - m6-2vcpu-16gb, m6-4vcpu-32gb, m6-8vcpu-64gb, m6-16vcpu-128gb, m6-24vcpu-192gb, m6-32vcpu-256gb
  #  - m-2vcpu-16gb, m-4vcpu-32gb, m-8vcpu-64gb, m-16vcpu-128gb, m-24vcpu-192gb, m-32vcpu-256gb
  #  - so1_5-2vcpu-16gb, so1_5-4vcpu-32gb, so1_5-8vcpu-64gb, so1_5-16vcpu-128gb, so1_5-24vcpu-192gb, so1_5-32vcpu-256gb
  #  - so-2vcpu-16gb, so-4vcpu-32gb, so-8vcpu-64gb, so-16vcpu-128gb, so-24vcpu-192gb, so-32vcpu-256gb
  #  - s-1vcpu-1gb, s-1vcpu-2gb, s-2vcpu-2gb, s-2vcpu-4gb, s-4vcpu-8gb, s-8vcpu-16gb
}

variable "do_name" {
  type    = string
  default = "TDA1"
}

variable "do_backup" {
  type    = bool
  default = false
}

variable "do_resize_disk" {
  type    = bool
  default = true
}

variable "do_monitoring" {
  type    = bool
  default = false
}

variable "do_ipv6" {
  type    = bool
  default = false
}

variable "do_vpc_uuid" {
  type    = string
  default = ""
}


