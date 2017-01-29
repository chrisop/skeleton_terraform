variable "az_1" {
  default     = "eu-central-1a"
  description = "Your Az1, use AWS CLI to find your account specific"
}

variable "az_2" {
  default     = "eu-central-1b"
  description = "Your Az2, use AWS CLI to find your account specific"
}

resource "aws_key_pair" "auth_playground" {
  key_name   = "terraform_keypair"
  public_key = "${file(var.public_key_path)}"
}

variable "public_key_path" {
  default = "files/root/.ssh/authorized_keys"
}

variable "zone_id" {
  default = "DNS_ZONE_ID_HERE"
}

variable "prefix" {
  default     = "playground"
  description = "The name of our org"
}

variable "environment" {
  default     = "playground"
  description = "The name of our sub project"
}

variable "ssl_cert" {
  default     = "id_of_the_certificate_in_elb"
  description = "ID of the SSL certificate"
}
