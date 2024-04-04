resource "local_file" "sample_res" {
  filename = "sample.txt"
  # file_permission = "0755"
  content = "hello"
}
