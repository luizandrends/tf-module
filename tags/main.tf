locals {
  environment_map = {
    "dev"  = "dev"
    "qa"   = "qa"
    "prod" = "prod"
  }

  environment = var.environment != null ? lower(trimspace(var.environment)) : null
  team        = lower(trimspace(var.team))
  product     = lower(trimspace(var.product))
  application = lower(trimspace(var.application))
  bu          = lower(trimspace(var.bu))

  default_name = local.environment != null ? format("%s-%s-%s", local.product, local.application, local.environment) : format("%s-%s", local.product, local.application)

  name = var.name != null ? trimspace(var.name) : local.default_name

  tags_optional = {
    "name"        = local.name
    "application" = local.application
  }

  tags_optional_normalized = local.tags_optional
  tags_optional_map        = local.environment != null ? merge({ "Environment" = local.environment_map[local.environment] }, local.tags_optional_normalized) : local.tags_optional_normalized

  required_tags = {
    "product"     = local.product
    "team"        = local.team
    "bu"          = local.bu
    "environment" = local.environment_map[local.environment]
    "ManagedBy"   = "Terraform"
  }

  tags_without_name = merge(local.required_tags, var.custom_tags)


  tags = merge(local.tags_optional_map, local.required_tags, var.custom_tags)

  resource                  = trimspace(var.resource)
  cloudwatch_log_group_name = format("/aws/%s/%s/%s/%s", local.product, local.environment, local.resource, local.name)

  asg_tags = [for k, v in local.tags : tomap({
    key                 = k
    value               = v
    propagate_at_launch = "true"
  })]

  asg_tags_without_name = [for k, v in local.tags_without_name : tomap({
    key                 = k
    value               = v
    propagate_at_launch = "true"
  })]
}
