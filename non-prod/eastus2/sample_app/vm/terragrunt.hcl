include "root" {
  path = find_in_parent_folders()
}

terraform {
    source = "git::https://github.com/rifat2113/repo1-tfmodules//azurerm_vm"
}

inputs = {
  resource_group_name  = "azurevm"
  location             = "East US 2"
  virtual_network_name = "Terragrunt-vnet"
  subnet_name          = "subnet-terragrunt"
  virtual_machine_name = "vm-linux"
  key_vault_name       = "kv-eus-poc-iac-01"
  key_vault_rg_name    = "azurevm"
  key_vault_key_name   = "cmk-0101"
  storage_account_name = "tfstatedemo12"
  storage_rg           = "azurevm"
  os_flavor            = "linux"
  # windows_distribution_name = "windows2019dc"
  linux_distribution_name = "ubuntu2004"
  virtual_machine_size    = "Standard_B2s"
  generate_admin_ssh_key  = true
  instances_count         = 1

  enable_proximity_placement_group = false
  enable_vm_availability_set       = false
  enable_public_ip_address         = false

  enable_boot_diagnostics = true
  data_disks = [
    {
      name                 = "disk1"
      disk_size_gb         = 100
      storage_account_type = "Standard_LRS"
    }
  ]

  deploy_log_analytics_agent                 = false
  tags = {
    ProjectName  = "demo-project"
    Env          = "non-prod"
    BusinessUnit = "CORP"
    ServiceClass = "Gold"
  }
}
