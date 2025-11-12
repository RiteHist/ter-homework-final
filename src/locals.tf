locals {
    subnet_map = { for i, name in var.resource_names_list : name => var.subnet_cidr_list[i] }
    ssh_pub_key = file(var.vm_ssh_key_path)
    vm_metadata_combined = merge(var.vm_metadata, {"user-data" = "${data.template_file.cloud-init.rendered}"})
}