terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }
}

variable "do_token" {
  type    = string
  default = "<INPUT_TOKEN_HERE>"
}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}
