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
        type = "PLAINTEXT"
        name = "APP_NAME"
        value = var.name_micro
    }
    environment_variable {
        type = "PLAINTEXT"
        name = "IMAGE_PORT"
        value = var.app_port
    }   
    environment_variable {
        type = "PLAINTEXT"
        name = "CLUSTER_NAME"
        value = var.cluster_name
    } 
        environment_variable {
        type = "PLAINTEXT"
        name = "SERVICE_NAME"
        value = var.service_name
    } 
           
           
 }
 source {
     type   = "CODEPIPELINE"
     buildspec = "3_ecs_con_codepipeline/buildspec/buildspec.yml" 
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
    action {
      name     = "Source"
      category = "Source"
      owner    = "AWS"
      provider = "CodeStarSourceConnection"
      version  = "1"
      output_artifacts = [
        "SourceArtifact",
      ]
      configuration = {
        FullRepositoryId     = var.app_repo
        BranchName           = "master"
        ConnectionArn        = aws_codestarconnections_connection.example.arn
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
            input_artifacts = ["SourceArtifact"]
            configuration = {
                ProjectName = "${var.name_micro}-build-project"
            }
        }
    }

  

}