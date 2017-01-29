resource "aws_s3_bucket" "tf_remote_state" {
  bucket = "${var.prefix}-tf-remote-state-${var.environment}"
  acl    = "authenticated-read"

  versioning {
    enabled = true
  }

  tags {
    Name        = "${var.prefix}-tf-remote-state-${var.environment}"
    Environment = "${var.environment}"
  }
}
