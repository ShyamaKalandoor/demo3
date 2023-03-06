# Define AWS provider
provider "aws" {
  region = "us-east-1" # Update with desired region
}

# Define variables
variable "bucket_name" {
  default = "my-s3-bucket" # Update with desired bucket name
}

# Create S3 bucket
resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name
  acl    = "public-read-write" # Set bucket access control to public read/write

  # Enable versioning for the bucket (optional)
  versioning {
    enabled = true
  }
}

# Output bucket URL
output "bucket_url" {
  value = "https://${var.bucket_name}.s3.amazonaws.com/"
}
