locals {
  team_name   = "identity"
  team_files = fileset("../${path.module}/data/${local.team_name}", "**/*.yaml")
  
  allroles = flatten([
    for f in local.team_files : [
      yamldecode(file("data/${f}"))["schema_roles"]
    ]
  ])
  roles =  toset(tolist(local.allroles))
      
}