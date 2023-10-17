##################################################################
# RBAC resources
##################################################################
# Create DB
module "create_db" {
     source  = "../module/create_db"   
}
# Create Schema
module "create_schema" {
     source  = "../module/create_schema"   
}
# Create Role
module "create_role" {
     source  = "../module/create_role"   
}
# Create Service user
module "create_service_user" {
     source  = "../module/create_service_user"   
}
# Create Masking Policy
module "create_maskingpolicy" {
     source  = "../module/create_maskingpolicy"   
}


##################################################################
# RBAC grant resources
##################################################################
# Grant to DB, Schema, Table, View, Procedure, Function
module "privilege_grants" {
     source  = "../module/privilege_grants"   
     depends_on = [
         module.create_role,
         module.create_service_user, 
         module.create_maskingpolicy,                          
     ]
}

module "role_grants" {
     source  = "../module/role_grants"   
     depends_on = [
         module.create_role,
         module.create_service_user,                         
     ]     
}

module "maskingpolicy_grants" {
     source  = "../module/maskingpolicy_grants"  
     depends_on = [
         module.create_maskingpolicy                         
     ]      
}

module "warehouse_grants" {
     source  = "../module/warehouse_grants"   
}