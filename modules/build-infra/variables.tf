variable "project_name" {
  default = "ico-fwd-reconnect-01"
}

variable "company_name" { 
  default = "fwd-reconnects"
}

variable "credentials" {
  default = "ico-fwd-reconnect-01-81b455f2b91c.json"
}

variable "environment" {
  type = string
  default = "sit"
}

variable "vm_instance_types" {
  type = map
  default = {
    "dev" = "n1-standard-1"
    "sit" = "n1-standard-2"
    "uat" = "n1-standard-2"
    "prod" = "n1-standard-4"
  }
}

variable "ip_cidr_range" {
  type = map
  default = {
    "dev" = "10.10.0.0/16"
    "sit" = "10.11.0.0/16"
    "uat" = "10.12.0.0/16"
    "prod" = "10.13.0.0/16" 
  }
}

variable "enable_flow_logging" {
  description = "Whether to enable VPC Flow Logs being sent to Stackdriver (https://cloud.google.com/vpc/docs/using-flow-logs)"
  type        = bool
  default     = true
}

variable "region" {
  type = string
  default = "asia-east1"
}

variable "regions" {
  type = list
  default = ["asia-east1","asia-east2","europe-north1","europe-west1"]
}


