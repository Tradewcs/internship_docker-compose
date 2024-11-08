terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.16"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "node" {
  name = "tradewcs/internship_project-frontend:frontend"
}

resource "docker_container" "node" {
  image = docker_image.node.name
  name  = "node_container"

  ports {
    internal = 3000
    external = 3000
  }
}
