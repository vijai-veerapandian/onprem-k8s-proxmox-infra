#  Local state for now. Each environment keeps its own state file

terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}
