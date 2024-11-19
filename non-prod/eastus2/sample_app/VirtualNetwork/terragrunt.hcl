include "root" {
  path = find_in_parent_folders()
}
# Change

terraform {
    source = "Azure/avm-res-network-virtualnetwork/azurerm"
}

inputs = {
 location               = "<azure region>"
address_space_start_ip = "10.0.0.0"
address_space_size     = 16
subnets = {
  AzureBastionSubnet = {
    size = 24
    has_nat_gateway = false
    has_network_security_group = false
  }
  private_endpoints  = {
    size = 28
    has_nat_gateway = false
    has_network_security_group = true
  }
  virtual_machines   = {
    size = 24
    has_nat_gateway = true
    has_network_security_group = false
  }
}
}



