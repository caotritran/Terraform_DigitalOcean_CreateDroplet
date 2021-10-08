output "PublicIP" {
  description = "The IP is:"
  value       = digitalocean_droplet.droplet-1.ipv4_address
}

output "password" {
  description = "The password is:"
  value       = random_string.random.*.result
}