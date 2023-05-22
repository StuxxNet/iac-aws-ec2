package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformAwsEc2Instance(t *testing.T) {
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../",
		Vars: map[string]interface{}{
			"private_ip":        "172.31.0.10",
			"vpc_id":            "vpc-0d7ee178466caab08",
			"subnet_id":         "subnet-07679ba9b8dee988f",
			"public_access_key": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC8W7Der02cqUz0A8582ykSpVhCcPXkVTR4Xj89DM9QCH3TnpTNW4KXr5YNgApDkaOkZPLT75N2W2xlibrjAotCNchbV00GMAYvNuH9NGnvT/NC7hYV6hvRZj8Xyu+b/wZnn2/X+DC37mUsf+NK7ep8hJAK4yqSbtn9Q6Yu8qi0+0XI94lIxVezm5WguMWOpyLY1BE+w7Jk5B/+eAeUEENGiNbx2BXbKfudvcU+d4YHPocNQgGuMa4oC1f5dvSAkH1H/b9DgjF/rC0rsusXkwjPE6O+8knmsZBj9LkSqQNzT6fRCUCLVs423GT62Il3lEwiX139uf79KM0BFh7Tr7YO98oxzqyYjSVKcS6OvlyesAzFIivbEYkBLeNZ3lJl3dmAS3LzlbOgVB9iaHRbGUPa68XwEumGxtTcNXMKX1hsRhjyL0/5XfQBjAVQDfuswpjbBZedtkIE8rNX/SDoZIyhkAFXfpFjI8YgJpETyRbRewbIl2BUZHUgZ3vvBShcaVBYKYKSYPnyKfNRraYgbj96rberC1sNwYOskSdCX1YhLbAStRL2vIXVIzOGKjn7ND9NRbRKbzrN9Yt6Nm4s5l885BC6qlm3gochPyKQ7S33rlDj4xCfKUIAGriGBu5FgcAigfzbh4gSMiU4kie+gIRQBIIK9bRz1p9kzp+SE6TKzQ== ramonborges@pop-os",
			"security_group_rules": map[string]interface{}{
				"ssh": map[string]interface{}{
					"type":        "ingress",
					"port":        "80",
					"protocol":    "TCP",
					"cidr_blocks": []string{"0.0.0.0/0"},
				},
			},
		},
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	rootDiskSize := terraform.Output(t, terraformOptions, "root_disk_size")
	assert.Equal(t, "8", rootDiskSize)
}
