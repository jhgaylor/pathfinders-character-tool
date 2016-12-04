output "pathfinder-character-tool-public-dns" {
  value = "${aws_instance.pathfinder-character-tool.public_dns}"
}

output "pathfinder-character-tool-ssh-example" {
  value = "ssh ubuntu@${aws_instance.pathfinder-character-tool.public_dns} -i ~/.ssh/${aws_instance.pathfinder-character-tool.key_name}.pem"
}

output "pathfinder-character-tool-app-url" {
  value = "${aws_instance.pathfinder-character-tool.public_dns}:3000"
}
