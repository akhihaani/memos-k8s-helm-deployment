include "root" {
  path   = find_in_parent_folders("root.hcl")
  expose = true
}

terraform {
  source = "../../modules/eks"
}

dependency "vpc" {
    config_path = "../vpc"
}

inputs = {
  region = include.root.locals.region
  tags   = include.root.locals.tags
  private_subnet_ids = dependency.vpc.outputs.memos_private_subnet
}