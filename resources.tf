resource "aws_instance" "app" {
  ami           = "ami-0af6e9042ea5a4e3e"
  instance_type = var.instance_type
  provider      = aws.sa

  tags = {
    Name = "${local.project_name}-app"
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.app.public_ip} > public_ip.txt"

    environment = {
      PUBLIC_IP = aws_instance.app.public_ip
    }
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nginx docker",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx",
      "sudo usermod -aG docker ubuntu",
      "sudo systemctl start docker",
      "sudo systemctl enable docker",
      "sudo docker pull nginx",
      "sudo docker run -d -p 80:80 nginx",
    ]

    scripts = [
      "scripts/app.sh",
      "scripts/install.sh",
    ]
  }
}
