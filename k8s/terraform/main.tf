terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

# Docker image build
resource "docker_image" "flask" {
  name = "flask-devops-app"
  build {
    context    = "/home/kavipriyan/devops-project1/app"   
    dockerfile = "Dockerfile"
  }
}

# Docker container run
resource "docker_container" "flask_container" {
  name  = "flask-container"
  image = docker_image.flask.name
  ports {
    internal = 5000
    external = 5001
  }
}
