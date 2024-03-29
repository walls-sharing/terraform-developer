# Variable Assignment

Via command line
```
terraform apply -var "filename=sample.txt"
export TF_VAR_filename=sample.txt
```

Via files
```
terraform.tfvars  <-- this exact file name is auto-loaded
terraform.tfvars.json
*.auto.tfvars
*.auto.tfvars.json
*.tfvars <-- need to specify via -var-file "something.tfvars"
```

Overriding (load-sequence)
1. Environment variable e.g. TF_VAR_filename=sample.txt
2. terraform.tfvars
3. variable.auto.tfvars
4. terraform apply -var-file "" -var "filename=sample-cmd-input.txt"
