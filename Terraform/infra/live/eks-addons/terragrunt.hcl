include "root" {
  path   = find_in_parent_folders("root.hcl")
  expose = true
}

terraform {
  source = "../../modules/eks-addons"
}

dependency "eks" {
    config_path = "../eks"
}

dependency "bootstrap" {
  config_path = "../../../bootstrap"
}

inputs = {
  tags   = include.root.locals.tags
  cluster_endpoint = dependency.eks.outputs.cluster_endpoint
  cluster_certificate_authority = dependency.eks.outputs.cluster_certificate_authority
  cluster_name = dependency.eks.outputs.cluster_name
  memos_hosted_zone_id = dependency.bootstrap.outputs.memos_hosted_zone_id
}