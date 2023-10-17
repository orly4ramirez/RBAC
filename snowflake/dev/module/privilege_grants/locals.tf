locals {
  team_name   = "identity"
  team_files = fileset("../${path.module}/data/${local.team_name}", "**/*.yaml")
  
  privilegemap_db = flatten([
    for f in local.team_files : [
      yamldecode(file("data/${f}"))["privilegemap_db"]
    ]
  ])
  # DB privileges
  privilegemapdbs = { for k, v in local.privilegemap_db: "${k}" => {
    privilege = v.privilege    
    database  = v.database
    role      = toset(tolist(v.role))     
    }
  }

  privilegemap_schema = flatten([
    for f in local.team_files : [
      yamldecode(file("data/${f}"))["privilegemap_schema"]
    ]
  ])  
  # Schema privileges  
  privilegemapschemas = { for k, v in local.privilegemap_schema: "${k}"  => {
    database  = v.database    
    schema    = v.schema
    privilege = v.privilege  
    role      = toset(tolist(v.role))       
    }
  }

  privilegemap_table = flatten([
    for f in local.team_files : [
      yamldecode(file("data/${f}"))["privilegemap_table"]
    ]
  ]) 
  # table privileges
  privilegemaptables = { for k, v in local.privilegemap_table: "${k}" => {
    database  = v.database
    schema    = v.schema
    privilege = v.privilege    
    role      = toset(tolist(v.role))        
    }
  }
 
  privilegemap_view = flatten([
    for f in local.team_files : [
      yamldecode(file("data/${f}"))["privilegemap_view"]
    ]
  ]) 
  # view privileges
  privilegemapviews = { for k, v in local.privilegemap_view: "${k}" => {
    database  = v.database
    schema    = v.schema
    privilege = v.privilege  
    role      = toset(tolist(v.role))          
    }
  }

  privilegemap_function = flatten([
    for f in local.team_files : [
      yamldecode(file("data/${f}"))["privilegemap_function"]
    ]
  ])   
  # function privileges
  privilegemapfunctions = { for k, v in local.privilegemap_function: "${k}" => {
    database    = v.database
    schema      = v.schema
    privilege   = v.privilege   
    role        = toset(tolist(v.role))      
    }
  } 

  # privilegemap_procedure = flatten([
  #   for f in local.team_files : [
  #     yamldecode(file("data/${f}"))["privilegemap_procedure"]
  #   ]
  # ])   
  # function privileges
  # privilegemapprocedures = { for k, v in local.privilegemap_procedure: "${k}" => {
  #   database    = v.database
  #   schema      = v.schema
  #   privilege   = v.privilege   
  #   role        = toset(tolist(v.role))      
  #   }
  # }

  # privilegemap_task = flatten([
  #   for f in local.team_files : [
  #     yamldecode(file("data/${f}"))["privilegemap_task"]
  #   ]
  # ])   
  # task privileges
  # privilegemaptasks = { for k, v in local.privilegemap_task: "${k}" => {
  #   database    = v.database
  #   schema      = v.schema  
  #   privilege  = v.privilege        
  #   role       = toset(tolist(v.role))        
  #   }
  # }   



}