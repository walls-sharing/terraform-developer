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

output "pet_name" {
  description = "Pet name"
  value = random_pet.pet_name.id
}

output "pet_age" {
  description = "Pet age"
  value = random_integer.pet_age.result
}


/*
* Exercise
* ========
* Let's output a random password using resource "random_password".
* Hint: the result of random_password is already treated as sensitive by the provider.
* Bonus: Try to format this file into basic module structure.
*
* Scroll down for answer..
*/














# # Answer
# resource  "random_password" "pet_password" {
#   length = 10
# }

# output "pet_password" {
#   sensitive = true
#   description = "Pet password !!??"
#   value = random_password.pet_password.result
# }
