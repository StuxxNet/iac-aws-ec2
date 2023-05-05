variable "instance_name" {
  type        = string
  description = "The name of the EC2 instance"
  default     = "terraformed-ec2-instance"
}

variable "instance_type" {
  type        = string
  description = "The type of EC2 instance to run"
  default     = "t3.micro"
  validation {
    condition     = var.instance_type == "t3.micro" || var.instance_type == "t3.medium" || var.instance_type == "t3.large"
    error_message = "Instance type must be t3.micro, t3.medium or t3.large"
  }
}

variable "associate_public_ip_address" {
  type        = bool
  description = "Associate a public IP address with the instance"
  default     = true
}

variable "private_ip" {
  type        = string
  description = "The private IP address to assign to the instance"
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID to launch the instance in"
}

variable "subnet_id" {
  type        = string
  description = "The subnet ID to launch the instance in"
}

variable "security_group_rules" {
  type = map(object({
    type        = string
    port        = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  description = "A list of security group rules to apply to the instance"
  default     = null
}

variable "instance_profile_policy_path" {
  type        = string
  description = "The policy to attach to the instance profile"
  default     = ""
}

variable "user_data" {
  type        = string
  description = "The user data to run when the instance starts"
  default     = ""
}

variable "root_volume_size" {
  type        = number
  description = "The size of the root volume in GB"
  default     = 8
}

variable "public_access_key" {
  type        = string
  description = "The public access key to use for SSH"
}

variable "ebs_block_devices" {
  type = list(object({
    device_name = string
    volume_size = number
  }))
  description = "A list of EBS block devices to attach to the instance"
  default     = null
}

variable "enable_hibernation" {
  type        = bool
  description = "Enable hibernation for the instance"
  default     = false
}

variable "default_tags" {
  type        = map(string)
  description = "Default tags to apply to all resources"
  default = {
    Environment = "Dev"
  }
}