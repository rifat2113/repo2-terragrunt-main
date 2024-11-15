include "root" {
  path = find_in_parent_folders()
}
# Change

terraform {
    source = "git::https://github.com/rifat2113/repo1-tfmodules/repo1-tfmodules-main//storage_account_module"
}

inputs = {
  resource_group_name = "Terragrunt-demo"

storage_accounts = {
  atstftststorageacct = {
    name         = "terragruntartifact123",
    sku          = "Standard_LRS",
    account_kind = "StorageV2",
    access_tier  = "Hot",
    network_rules = {
      bypass                     = ["None"],
      default_action             = "Allow",
      ip_rules                   = [],
      virtual_network_subnet_ids = []
    },
    managed_identity_type   = "SystemAssigned"
    enable_large_file_share = false,
  }
}

tags = {
  "date" = "14/11/2024"
}

containers = {
  tfTstStorageContainer = {
    name                  = "terragruntartifact123container",
    storage_account_name  = "terragruntartifact123",
    container_access_type = "container"
  }
}
}
