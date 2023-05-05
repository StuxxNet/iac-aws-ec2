## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.65.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.65.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.public_access](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/eip) | resource |
| [aws_iam_instance_profile.ec2_instance_profile](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/iam_instance_profile) | resource |
| [aws_iam_policy.instance_profile_policy](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/iam_policy) | resource |
| [aws_iam_role.instance_profile_role](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.instance_profile_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_instance.this](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/instance) | resource |
| [aws_key_pair.access_key](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/key_pair) | resource |
| [aws_kms_alias.this](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/kms_alias) | resource |
| [aws_kms_key.this](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/kms_key) | resource |
| [aws_network_interface.this](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/network_interface) | resource |
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/security_group) | resource |
| [aws_security_group_rule.example](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/security_group_rule) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/data-sources/ami) | data source |
| [aws_iam_policy_document.instance_profile_assume_role](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_associate_public_ip_address"></a> [associate\_public\_ip\_address](#input\_associate\_public\_ip\_address) | Associate a public IP address with the instance | `bool` | `true` | no |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | Default tags to apply to all resources | `map(string)` | <pre>{<br>  "Environment": "Dev"<br>}</pre> | no |
| <a name="input_ebs_block_devices"></a> [ebs\_block\_devices](#input\_ebs\_block\_devices) | A list of EBS block devices to attach to the instance | <pre>list(object({<br>    device_name = string<br>    volume_size = number<br>  }))</pre> | `null` | no |
| <a name="input_enable_hibernation"></a> [enable\_hibernation](#input\_enable\_hibernation) | Enable hibernation for the instance | `bool` | `false` | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | The name of the EC2 instance | `string` | `"terraformed-ec2-instance"` | no |
| <a name="input_instance_profile_policy_path"></a> [instance\_profile\_policy\_path](#input\_instance\_profile\_policy\_path) | The policy to attach to the instance profile | `string` | `""` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The type of EC2 instance to run | `string` | `"t3.micro"` | no |
| <a name="input_private_ip"></a> [private\_ip](#input\_private\_ip) | The private IP address to assign to the instance | `string` | n/a | yes |
| <a name="input_public_access_key"></a> [public\_access\_key](#input\_public\_access\_key) | The public access key to use for SSH | `string` | n/a | yes |
| <a name="input_root_volume_size"></a> [root\_volume\_size](#input\_root\_volume\_size) | The size of the root volume in GB | `number` | `8` | no |
| <a name="input_security_group_rules"></a> [security\_group\_rules](#input\_security\_group\_rules) | A list of security group rules to apply to the instance | <pre>map(object({<br>    type        = string<br>    port        = number<br>    protocol    = string<br>    cidr_blocks = list(string)<br>  }))</pre> | `null` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The subnet ID to launch the instance in | `string` | n/a | yes |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | The user data to run when the instance starts | `string` | `""` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC ID to launch the instance in | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | value of the instance id |
