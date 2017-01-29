#!/usr/bin/env bash
# load modules
terraform get -update
# validate code
terraform validate
# reformat code
terraform fmt
# generate resource graph
terraform graph | dot -Tpng > /tmp/simple_tf.png
# generate plan
terraform plan -o plan.out
# apply generated plan
terraform apply plan.out

# Migrate local terraform setup to S3 backend for state file
terraform remote config -backend=s3 -backend-config="region=eu-central-1" -backend-config="bucket=companyname-tf-remote-state-playground" -backend-config="key=terraform.tfstate"
