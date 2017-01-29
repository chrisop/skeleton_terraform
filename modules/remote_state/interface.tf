variable "region" {
  default     = "eu-central-1"
  description = "The AWS region."
}

variable "prefix" {
  default     = "companyname"
  description = "The name of our org, i.e. companyname."
}

variable "environment" {
  default     = "remote_state"
  description = "The name of our sub project, i.e. remote_state."
}

output "s3_bucket_id" {
  value = "${aws_s3_bucket.tf_remote_state.id}"
}
