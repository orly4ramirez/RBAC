###########################################################
# Get Database in Snowflake
###########################################################
# data "snowflake_database" "this" {
#   name = var.db_name
# }
# data "snowflake_schemas" "list" {
#   database = var.db_name
# }

###########################################################
# Grants
###########################################################

# DB privileges 
resource "snowflake_database_grant" "this" {
  for_each      = local.privilegemapdbs
  database_name = each.value.database
  privilege     = each.value.privilege
  roles         = each.value.role
  with_grant_option = false  
  enable_multiple_grants = true     
}

# Schema privileges  
resource "snowflake_schema_grant" "this" {
  for_each      = local.privilegemapschemas
  database_name = each.value.database
  schema_name   = each.value.schema  
  privilege     = each.value.privilege
  roles         = each.value.role 
  with_grant_option = false 
  enable_multiple_grants = true   
  # on_future         = true
}

# table privileges  
resource "snowflake_table_grant" "this" {
  for_each      = local.privilegemaptables
  database_name = each.value.database
  schema_name   = each.value.schema
  # table_name    = each.value.table  
  privilege     = each.value.privilege
  roles         = each.value.role
  with_grant_option = false
  enable_multiple_grants = true     
  on_future         = true  
}

# view privileges on databases
resource "snowflake_view_grant" "this" {
  for_each      = local.privilegemapviews
  database_name = each.value.database
  schema_name   = each.value.schema
  # view_name     = each.value.view 
  privilege     = each.value.privilege
  roles         = each.value.role
  with_grant_option = false
  enable_multiple_grants = true     
  on_future         = true    
}

# function privileges on databases
resource "snowflake_function_grant" "this" {
  for_each      = local.privilegemapfunctions
  database_name = each.value.database
  schema_name   = each.value.schema
  # function_name = each.value.function
  privilege     = each.value.privilege
  roles         = each.value.role
  # return_type   = each.value.return_type
  with_grant_option = false
  enable_multiple_grants = true     
  on_future         = true     
}

# resource "snowflake_procedure_grant" "this" {
#   for_each      = local.privilegemapprocedures
#   database_name = each.value.database
#   schema_name   = each.value.schema
#   privilege     = each.value.privilege
#   roles         = each.value.role
#   with_grant_option = false
#   enable_multiple_grants = true  
#   on_future         = true 
# }

# resource "snowflake_task_grant" "this" {
#   for_each      = local.privilegemaptasks
#   database_name = each.value.database
#   schema_name   = each.value.schema
#   privilege     = each.value.privilege
#   roles         = each.value.role
#   with_grant_option = false
#   enable_multiple_grants = true     
#   on_future         = true 
# }






