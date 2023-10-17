locals {
  team_name   = "identity"
  team_files = fileset("../${path.module}/data/${local.team_name}", "**/*.yaml")
  
  rolemap = flatten([
    for f in local.team_files : [
      yamldecode(file("data/${f}"))["rolemap"]
    ]
  ])
  rolemaps  = { for k, v in local.rolemap : "${k}" => {
    grantee = v.grantee
    role    = toset(tolist(v.role))   
    }
  }


  serviceuser_rolemap = flatten([
    for f in local.team_files : [
      yamldecode(file("data/${f}"))["serviceuser_rolemap"]
    ]
  ])     
  serviceuser_rolemaps = { for k, v in local.serviceuser_rolemap : "${k}" => {
    grantee   = v.grantee
    user      = toset(tolist(v.user))
    }  
  }



}