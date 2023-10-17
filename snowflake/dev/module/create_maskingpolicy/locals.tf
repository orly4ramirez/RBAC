locals {
  team_name  = var.team_name
  team_files = fileset("../${path.module}/data/${local.team_name}", "**/*.yaml")

  maskingpolicy = flatten([
    for f in local.team_files : [
      yamldecode(file("data/${f}"))["maskingpolicy"]
    ]
  ])
  # masking policy
  maskingpolicies = { for k, v in local.maskingpolicy : "${k}" => {
    name               = v.name
    database           = v.database
    schema             = v.schema
    value_data_type    = v.value_data_type
    masking_expression = v.masking_expression
    return_data_type   = v.return_data_type
    }
  }
}