variable "prefix" {
  description = "The prefix which should be used for all resources in this example"
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
}

variable "rgName" {
  description = " Resource Group Name"
  default = "do_not_delete_New_RG"
  }

variable "region"{
  descriptin = "Region Name"
  default = "West US"
  }
