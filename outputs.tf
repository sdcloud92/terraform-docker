#Best way to to display important metadata about our deployment
#Export sate information about deployment in CLI 

output "container-name" {
  value       = docker_container.nodered_container.name
  description = "The name of the container"
}

output "ip_address" {
  value       = join(":", [docker_container.nodered_container.ip_address, docker_container.nodered_container.ports[0].external])
  description = "The value of the IP address and external port"
}