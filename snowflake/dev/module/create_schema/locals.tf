locals {
  team_name   = "identity"
  team_files = fileset("../${path.module}/data/${local.team_name}", "**/*.yaml")
  
  schema_create = flatten([
    for f in local.team_files : [
      yamldecode(file("data/${f}"))["database_create"]
    ]
  ])
  schemas =  toset(tolist(local.schema_create))       
      
}