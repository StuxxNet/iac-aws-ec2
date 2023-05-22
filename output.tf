output "instance_id" {
  value       = aws_instance.this.id
  description = "value of the instance id"
}

output "root_disk_size" {
    value       = aws_instance.this.root_block_device.0.volume_size
    description = "value of root the disk size"
}