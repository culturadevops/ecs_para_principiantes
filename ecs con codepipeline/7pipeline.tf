resource "aws_codebuild_project" "tf-plan" {
  name          = "${var.name_micro}-build-project"
  description   = "pipeline for microservicio1"
  service_role  =  aws_iam_role.assume_codebuild_role.arn

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:4.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode = true
    environment_variable {
        name  = "ECR_DIR"
        value = aws_ecr_repository.microservicio.repository_url
    }
    environment_variable {
        type = "SECRETS_MANAGER"
        name = "DOCKERHUB_USER"
        value = "${aws_secretsmanager_secret.dockerhubconnection.arn}:Username"
    }
    environment_variable {
        type = "SECRETS_MANAGER"
        name = "DOCKERHUB_PASS"
        value = "${aws_secretsmanager_secret.dockerhubconnection.arn}:Password"
    }
 }
 source {
     type   = "CODEPIPELINE"
     buildspec = "buildspec.yml" 
 }
}

resource "aws_codepipeline" "pipeline" {

    name = var.name_micro
      role_arn = aws_iam_role.assume_codepipeline_role.arn

    artifact_store {
        type="S3"
        location = aws_s3_bucket.codepipeline_artifacts.id
    }
   stage {
        name = "Source"
        action{
            name = "Source"
            category = "Source"
            owner = "AWS"
            provider = "CodeCommit"
            version = "1"
            output_artifacts = ["code"]
            configuration = {
                RepositoryName = "dockerfile-hub"
                BranchName     = "master"
                OutputArtifactFormat = "CODE_ZIP"
            }
        }
    }

    stage {
        name ="build"
        action{
            name = "Build"
            category = "Build"
            provider = "CodeBuild"
            version = "1"
            owner = "AWS"
            input_artifacts = ["code"]
            configuration = {
                ProjectName = "${var.name_micro}-build-project"
            }
        }
    }

  

}