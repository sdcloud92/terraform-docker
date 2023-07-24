#Set out our Provider
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.15.0"
      version = "~>2.15.0"
    }
  }
}

#{} empty because we are using a "local" host not remote server
provider "docker" {}

#Find the latest nodered image
resource "docker_image" "nodered_image" {
  name = "nodered/node-red:latest"
}

# Start a container
resource "docker_container" "nodered_container" {
  name  = "nodered"
  image = docker_image.nodered_image.latest
  ports {
    internal = 1880
    external = 1880
  }
}
