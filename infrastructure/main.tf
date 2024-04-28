module "codecommit" {
  source          = "./modules/cicd/codecommit"
  repository_name = var.repository_name

}

module "codebuild" {
  source               = "./modules/cicd/codebuild"
  codebuild_project    = var.codebuild_project
  codecommit_repo_name = module.codecommit.repository_name
  depends_on           = [module.codecommit]

}

# module "alb" {
#   source   = "./modules/app/alb"
#   alb_name = var.alb_name
#   vpc_id   = var.vpc_id

# }

module "asg" {
  source               = "./modules/app/asg"
  launch_template_name = var.launch_template_name
  tg_arn               = module.alb.tg_arn
  alb_sg_id            = module.alb.sg_id
  #depends_on           = [module.alb]

}

module "codedeploy" {
  source                           = "./modules/cicd/codedeploy"
  codedeploy_name                  = var.codedeploy_name
  codedeploy_deployment_group_name = var.codedeploy_deployment_group_name
  asg                              = [module.asg.asg_name]
  #alb_name                         = module.alb.alb_name
  #depends_on                       = [module.alb, module.asg]

}

module "codepipeline" {
  source                      = "./modules/cicd/codepipeline"
  codepipeline_name           = var.codepipeline_name
  repository_name             = module.codecommit.repository_name
  codebuild_project_name      = var.codebuild_project
  codedeploy_application_name = var.codedeploy_name
  deployment_group_name       = var.codedeploy_deployment_group_name
  repo_arn                    = module.codecommit.repo_arn
}
