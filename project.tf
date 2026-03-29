tags = {
  environment = "testing"
  managed_by  = "terraform"
  project     = "vm-deployment"
}


variable "address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}