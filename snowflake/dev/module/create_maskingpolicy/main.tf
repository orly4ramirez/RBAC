############################################################################################################
# Create masking Policy
############################################################################################################  

resource "snowflake_masking_policy" "this" {
  for_each           = local.maskingpolicies
  name               = each.value.name
  database           = each.value.database
  schema             = each.value.schema
  value_data_type    = each.value.value_data_type
  masking_expression = each.value.masking_expression
  return_data_type   = each.value.return_data_type
}