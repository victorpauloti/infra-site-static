resource "aws_s3_bucket_policy" "allow_access_all_read" {
  bucket = aws_s3_bucket.bucketstars.id
  policy = data.aws_iam_policy_document.allow_access_read.json
}

data "aws_iam_policy_document" "allow_access_read" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject",
      "s3:GetObjectVersion",
    ]

    resources = [
      aws_s3_bucket.bucketstars.arn,
      "${aws_s3_bucket.bucketstars.arn}/*",
    ]
  }
}