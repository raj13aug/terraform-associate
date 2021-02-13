provider "aws" {
  region     = "us-east-2"
  access_key = "AKIA5SOYxxxxxxxxxx"
  secret_key = "p9e5ZSuOG5gDxqHxxxxxxx"
}

variable "AMI_image" {
  description = "The name of the resource group"
}

variable "type" {
  description = "The name of the azure location"
  default     = "t2.micro"
  validation {
    condition     = can(index(["t3.medium", "t2.micro"], var.type) >= 0)
    error_message = "The location must be t2 or t2.micro."
  }
}


resource "aws_instance" "example" {
  ami           = var.AMI_image
  instance_type = var.type

}
