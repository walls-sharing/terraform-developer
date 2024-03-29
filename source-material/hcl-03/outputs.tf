# output "pet_name" {
#   description = "Pet name"
#   value = random_pet.pet_name.id
# }

# output "pet_age" {
#   description = "Pet age"
#   value = random_integer.pet_age.result
# }

# output "pet_password" {
#   sensitive = true
#   description = "Pet password !!??"
#   value = random_password.pet_password.result
# }


# output "pet_name_content" {
#   description = "Pet name from file content"
#   value = local_file.pet.content
# }

# output "pet_password_content" {
#   sensitive = true  # required
#   description = "Pet password from file content"
#   value = local_sensitive_file.pet_password.content
# }
