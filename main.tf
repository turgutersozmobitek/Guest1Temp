#bir oluşturalım 

resource "vcd_vapp_vm" "web1" {
  vapp_name     = var.vapp_name
  name          = var.vm_name
  computer_name = var.computer_name
  catalog_name  = var.catalog_name
  template_name = var.template_name
  memory        = var.vm_memory
  cpus          = var.vm_cpu
  cpu_cores     = var.vm_cpu_core
  cpu_hot_add_enabled=true
  memory_hot_add_enabled=true
  power_on=true

    override_template_disk {
    bus_type        = "paravirtual"
    size_in_mb      = var.vm_disk_size
    bus_number      = 0
    unit_number     = 0
    iops            = 0
  }



  network {
    type               = "org"
    name               = var.org_network_name
    ip_allocation_mode = "MANUAL"
    ip                 = var.vm_ip
    adapter_type       = var.adapter_type
    is_primary         = true
  } 
 
  customization {
    enabled                    = true
    change_sid                 = true
    allow_local_admin_password = true
    auto_generate_password     = false
    admin_password             = var.vm_admin_password
    # Other customization options to override the ones from template
  }

}


