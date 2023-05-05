variable "instance_name" {
  type        = string
  description = "The name of the EC2 instance"
  default     = "terraformed-ec2-instance"
}

variable "instance_type" {
  type        = string
  description = "The type of EC2 instance to run"
  default     = "t3.micro"
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
  type        = list(object({
    device_name = string
    volume_size = number
  }))
  description = "A list of EBS block devices to attach to the instance"
  default     = null
}

variable "enable_hybernation" {
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