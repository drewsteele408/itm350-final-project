output "instance_public_ip" {
  value       = aws_instance.minecraft.public_ip
  description = "Public IP of the Minecraft server"
}

output "minecraft_server_address" {
  value       = "${aws_instance.minecraft.public_ip}:${var.server_port}"
  description = "Address to connect to the Minecraft server"
}