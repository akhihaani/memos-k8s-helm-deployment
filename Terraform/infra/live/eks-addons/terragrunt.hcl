include "root" {
  path   = find_in_parent_folders("root.hcl")
  expose = true
}

terraform {
  source = "../../modules/eks-addons"
}

dependency "eks" {
    config_path = "../eks"

    mock_outputs = {
      cluster_endpoint = "https://mock.eks.amazonaws.com"
      cluster_certificate_authority = "bW9jaw=="
      cluster_name = "mock-cluster"
    }
    mock_outputs_allowed_terraform_commands = ["init", "validate", "plan"]
}

dependency "bootstrap" {
  config_path = "../../../bootstrap"

  mock_outputs = {
    memos_hosted_zone_id = "ZMOCK000000000"
  }
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan"]
}

inputs = {
  tags   = include.root.locals.tags
  cluster_endpoint = dependency.eks.outputs.cluster_endpoint
  cluster_certificate_authority = dependency.eks.outputs.cluster_certificate_authority
  cluster_name = dependency.eks.outputs.cluster_name
  memos_hosted_zone_id = dependency.bootstrap.outputs.memos_hosted_zone_id
}