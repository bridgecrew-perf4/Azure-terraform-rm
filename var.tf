variable "subscriptionId" {
}

variable "clientId" {
}

variable "clientSecret" {
}

variable "tenantId" {
}


variable "prefix" {
  description = "The prefix which should be used for all resources in this example"
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
}

variable "password" {
  description = "password for server"
  }


variable "rgName" {
  description = " Resource Group Name"
  default = "do_not_delete_New_RG"
  }

variable "region"{
  description = "Region Name"
  default = "West US"
  }

variable "projectname"{
   description = "project"
  }

