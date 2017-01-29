resource "aws_s3_bucket" "project1" {
  bucket = "${var.prefix}-project1-${var.environment}"
  acl    = "authenticated-read"

  versioning {
    enabled = true
  }

  tags {
    Name        = "${var.prefix}-project1-${var.environment}"
    Environment = "${var.environment}"
  }

  lifecycle_rule {
    id                                     = "move-noncurrent-versions"
    enabled                                = true
    prefix                                 = ""
    abort_incomplete_multipart_upload_days = 7

    # Noncurrent Versions: Transition to the Standard - Infrequent Access Storage Class after 30 days
    noncurrent_version_transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    # Noncurrent Versions: Archive to the Glacier Storage Class after 60 days
    noncurrent_version_transition {
      days          = "60"
      storage_class = "GLACIER"
    }
  }
}
