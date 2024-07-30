# output "instance_public_http_url" {
#   value = aws_instance.instance[0].public_ip != "" ? "http://${aws_instance.instance[0].public_ip}" : "Instance not created"
# }

output "current_workspace_name" {
  value = terraform.workspace
}
