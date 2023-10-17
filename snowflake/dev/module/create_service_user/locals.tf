locals {
  team_name   = "identity"
  team_files = fileset("../${path.module}/data/${local.team_name}", "**/*.yaml")
  
  serviceuser = flatten([
    for f in local.team_files : [
      yamldecode(file("data/${f}"))["serviceuser"]
    ]
  ])
  serviceusers = { for k, v in local.serviceuser : "${k}" => {
    login_name   = v.login_name
    default_role = v.default_role
     }
  } 



}