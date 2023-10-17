locals {
  project_type = "service"
  project_name = "rbac"
  environment  = "DEV"
 
  okta_org_name       = "videoamp-test"
  okta_base_url       = "okta.com/"
  okta_path           = "secrets/v2/service/okta/dev"  


############################################################################################################
# OKTA
############################################################################################################  
# decode the okta yaml file 
okta_yaml_file = yamldecode(file("okta.yaml"))


############################################################################################################
# Adding User to OKTA
############################################################################################################   
# List of users to add to OKTA  
    # parse User
    okta_add_users_map = { for user in local.okta_yaml_file.okta_add_users_map : user.login => {
      first_name           = user.first_name
      last_name            = user.last_name
      login                = user.login
      email                = user.email
      password_inline_hook = user.password_inline_hook
      } 
    }    
############################################################################################################
# Adding Group to Okta
############################################################################################################
# List of groups (Functional roles) to add to OKTA 
    # parse Groups
    okta_group_names = { for group in local.okta_yaml_file.okta_group_names: group.okta_group_name => {
      okta_group_name        = group.okta_group_name
      okta_group_description = group.okta_group_description
      okta_group_skip_users  = group.okta_group_skip_users
      } 
    }
############################################################################################################
# Assign okta users to a Functional Role (okta group) and applications
############################################################################################################
    # parse RBAC assignment
    assign = { for name, assign in local.okta_yaml_file.assign: "${assign.groupname}" => {
      groupname = assign.groupname
      app       = assign.app
      
      employees = {for emp in assign.employees: emp.login => {
        login = emp.login
        }
       }
     }
    }
    
# end of local"
}    