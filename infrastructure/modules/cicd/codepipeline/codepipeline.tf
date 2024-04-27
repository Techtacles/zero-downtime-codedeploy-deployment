
module "codepipeline_artifact_bucket" {
  source          = "../artifacts/s3"
  artifact_bucket = "zero-downtime-deployment-cp-artifact-bucket"

}

resource "aws_codepipeline" "codepipeline" {
  name     = var.codepipeline_name
  role_arn = aws_iam_role.codepipeline_role.arn

  artifact_store {
    location = module.codepipeline_artifact_bucket.s3_bucket
    type     = "S3"

    # encryption_key {
    #   id   = data.aws_kms_alias.s3kmskey.arn
    #   type = "KMS"
    # }
  }

  stage {
    name = "codecommit-src-stage"

    action {
      name             = "codecommit-src"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeCommit"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        RepositoryName = var.repository_name
        BranchName     = "main"
      }

    }
  }

  stage {
    name = "Build"

    action {
      name             = "Codebuild"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]
      version          = "1"

      configuration = {
        ProjectName = var.codebuild_project_name

      }
    }
  }

  stage {
    name = "Deploy"

    action {
      name            = "codedeploy-deployment"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "CodeDeploy"
      input_artifacts = ["build_output"]
      version         = "1"

      configuration = {
        ApplicationName     = var.codedeploy_application_name
        DeploymentGroupName = var.deployment_group_name
      }
    }
  }
}
