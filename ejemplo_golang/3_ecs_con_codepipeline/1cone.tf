resource "aws_codestarconnections_connection" "example" {
  name          = "connection"
  provider_type = "GitHub"
}
