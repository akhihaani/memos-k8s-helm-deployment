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

inputs = {
  region = include.root.locals.region
  tags   = include.root.locals.tags
  cluster_endpoint = dependency.eks.outputs.cluster_endpoint
  cluster_certificate_authority = dependency.eks.outputs.cluster_certificate_authority
  cluster_name = dependency.eks.outputs.cluster_name
}