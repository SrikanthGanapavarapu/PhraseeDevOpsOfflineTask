# Create a bucket
resource "aws_s3_bucket" "create_bucket" {

  bucket        = var.s3_bucket_name
  force_destroy = true
  tags = {
    Name        = "s3 bucket"
    Environment = "Test"
  }
}

resource "aws_s3_bucket_acl" "s3_acl" {
  bucket = aws_s3_bucket.create_bucket.id
  acl    = "private"
}

# Upload an object
resource "aws_s3_object" "object" {

  bucket = aws_s3_bucket.create_bucket.id
  key    = "index.html"
  acl    = "private"
  source = "index.html"
  etag   = filemd5("index.html")

}