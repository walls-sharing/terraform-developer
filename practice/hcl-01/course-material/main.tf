resource "local_file" "sample_res" {
  filename = "sample.txt"
  # file_permission = "0755"
  content = "hello"
}

resource "local_sensitive_file" "sample_cred" {
  filename = "sample-cred.txt"
  content  = "Can you see me?"
}
