output "instance_name" {
  description = "Name of the VM instance"
  value       = google_compute_instance.vm_instance.name
}

output "instance_ip" {
  description = "External IP of the VM instance"
  value       = google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip
}
