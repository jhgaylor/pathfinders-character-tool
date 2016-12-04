output "pathfinder-character-tool-public-dns" {
  value = "${aws_instance.pathfinder-character-tool.public_dns}"
}

output "pathfinder-character-tool-key-name" {
  value = "${aws_instance.pathfinder-character-tool.key_name}"
}

output "pathfinder-character-tool-ssh-example" {
  value = "ssh ubuntu@${aws_instance.pathfinder-character-tool.public_dns} -i ~/.ssh/${aws_instance.pathfinder-character-tool.key_name}"
}