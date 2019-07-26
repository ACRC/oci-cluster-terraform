data "local_file" "ssh_private_key" {
  filename = "${var.private_key_path}"
}
data "local_file" "ssh_public_key" {
  filename = "${var.public_key_path}"
}

data "template_file" "bootstrap-script"{
    template    = "${file("${path.module}/../common-files/bootstrap.sh.tpl")}"
    vars {
        ansible_branch  = "${var.management_compute_instance_config["ansible_branch"]}"
        cloud-platform  = "google-cloud"
        fileserver-ip   = "${module.filestore_shared_storage.fileserver-ip}"
    }
}

# data "template_file" "startnode-yaml" {
#   template      = "${file("${path.module}/../files/startnode.yaml.tpl")}"
#   vars {
#   }
# }