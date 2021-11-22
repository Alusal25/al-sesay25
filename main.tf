resource "aws_s3_bucket" "lifecycle-testing" {
  bucket = var.name
  acl    = "private"

  lifecycle_rule {
    id      = "archive"
    enabled = true

    prefix = "archive/"

    tags = {
      rule = "archive"
    }
    transition {
      days          = 90
      storage_class = "GLACIER"
    }
  }
  lifecycle_rule {
    id      = "log"
    enabled = true

    prefix = "log/"

    tags = {
      rule      = "log"
      autoclean = "true"
    }
    expiration {
      days = 90
    }
  }
}