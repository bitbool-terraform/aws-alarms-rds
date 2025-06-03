variable "metrics" {
  type = map
  default = {
    "CPU" = {
      "metric_name" = "CPUUtilization"
      "stat" = "Average"
      "unit" = "Percent"
      "comparison_operator" = "GreaterThanOrEqualToThreshold"
      "namespace" = "AWS/RDS"
      "treat_missing_data" = "breaching"
      "threshold_multiplier" = 1
    }
    "Storage" = {
      "metric_name" = "FreeStorageSpace"
      "stat" = "Minimum"
      "unit" = "Bytes"
      "comparison_operator" = "LessThanOrEqualToThreshold"
      "namespace" = "AWS/RDS"
      "treat_missing_data" = "breaching"
      "threshold_multiplier" = 1000000000
    }
    "Memory" = {
      "metric_name" = "FreeableMemory"
      "stat" = "Minimum"
      "unit" = "Bytes"
      "comparison_operator" = "LessThanOrEqualToThreshold"
      "namespace" = "AWS/RDS"
      "treat_missing_data" = "breaching"
      "threshold_multiplier" = 1000000000
    }    
    "Connections" = {
      "metric_name" = "DatabaseConnections"
      "stat" = "Average"
      "unit" = "Count"
      "comparison_operator" = "GreaterThanOrEqualToThreshold"
      "namespace" = "AWS/RDS"
      "treat_missing_data" = "breaching"
      "threshold_multiplier" = 1
    }       
    "UsedTransactionIDs" = {
      "metric_name" = "MaximumUsedTransactionIDs"
      "stat" = "Average"
      "unit" = "Count"
      "comparison_operator" = "GreaterThanOrEqualToThreshold"
      "namespace" = "AWS/RDS"
      "treat_missing_data" = "breaching"
      "threshold_multiplier" = 1
    }       
  }
}



variable "create_alarms" { default = ["CPU","Storage","Memory","Connections","UsedTransactionIDs"] }

variable "default_threshold" { 
  type = map
  default = {
    "CPU" = 80
    "Storage" = 10
    "Memory" = 2
    "Connections" = 100
    "UsedTransactionIDs" = 500000000
  } 
}

variable "default_evaluation_periods" { default = 2 }
variable "default_period" { default = 60 }

variable "threshold" { default = {} }

variable "evaluation_periods" { default = {} }
variable "period" { default = {} }

variable "DBInstanceIdentifier" {}
variable "description" {}
variable "prefix" {}

variable "actions" { default = null }
variable "alarm_actions" { default = null }
variable "ok_actions" { default = null }
variable "insufficient_data_actions" { default = null }
