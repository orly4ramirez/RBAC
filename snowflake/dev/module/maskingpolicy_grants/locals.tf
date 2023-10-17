locals {
  team_name   = "identity"
  team_files = fileset("../${path.module}/data/${local.team_name}", "**/*.yaml")
  
  maskingpolicy_map = flatten([
    for f in local.team_files : [
      yamldecode(file("data/${f}"))["maskingpolicy_map"]
    ]
  ])        
 # masking policy grants
  maskingpolicy_maps = { for k, v in local.maskingpolicy_map: "${k}" => {
    database            = v.database
    schema              = v.schema
    masking_policy_name = v.masking_policy_name    
    privilege           = v.privilege
    role                = toset(tolist(v.role))    
    }
  }          
}