# REF: https://registry.terraform.io/providers/hashicorp/random/latest/docs
resource "random_pet" "pet_name" {
}

resource "random_integer" "pet_age" {
  min = 1
  max = 100
}

resource "local_file" "pet" {
  filename = "pet.txt"
  content  = random_pet.pet_name.id
}

resource "local_file" "pet_age" {
  filename = "pet-age.txt"
  content  = random_integer.pet_age.result
}


# # Exercise
# resource  "random_password" "pet_password" {
#   length = 10
# }

# # REF: https://registry.terraform.io/providers/hashicorp/local/latest/docs
# resource "local_sensitive_file" "pet_password" {
#   filename = "pet-password.txt"
#   content  = random_password.pet_password.result
# }
