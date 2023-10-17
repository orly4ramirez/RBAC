locals {
  team_name   = "identity"
  team_files = fileset("../${path.module}/data/${local.team_name}", "**/*.yaml")
  
  privilegemap_warehouse = flatten([
    for f in local.team_files : [
      yamldecode(file("data/${f}"))["privilegemap_warehouse"]
    ]
  ]) 
  # warehouse privileges
  privilegemapwarehouses = { for k, v in local.privilegemap_warehouse: "${k}" => {
    warehouse  = v.warehouse
    privilege  = v.privilege   
    role       = toset(tolist(v.role))        
    }
  }         
}