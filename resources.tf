resource "aws_instance" "app" {
  ami           = "ami-0af6e9042ea5a4e3e"
  instance_type = var.instance_type

  tags = {
    Name = "${local.project_name}-app"
  }
}