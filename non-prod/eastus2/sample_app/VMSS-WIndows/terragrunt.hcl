include "root" {
  path = find_in_parent_folders()
}
# Change

terraform {
    source = "git::https://github.com/rifat2113/repo1-tfmodules//VirtualNetwork"
}

inputs = {
 location               = "East US 2"

tags = {
  type = "avm"
  env  = "demo"
}
}
