resource "aws_s3_bucket" "codepipeline_artifacts" {
  bucket = var.codepipeline_artifacts
} 
