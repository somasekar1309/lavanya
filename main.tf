# creating the vpc and subnet
resource "google_compute_network" "vpc_network" {
  project                                   = var.gcp_project
  name                                      = var.gcp_project
  auto_create_subnetworks                   = false
}
# creating the subnet
resource "google_compute_subnetwork" "subnet_network" {
  name          = "new-subnetwork"
  ip_cidr_range = "10.2.0.0/23"
  region        = var.gcp_regions[0]
  network       = google_compute_network.vpc_network.self_link
}

# craeting the virtual machine 

# Creating the VM
resource "google_compute_instance" "vm" {
  name         = var.machine_name
  machine_type = var.machine_type
  zone        = var.gcp_az


  boot_disk {                 # os(operating system)
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {                                       # network and subnet should be added below
    network = google_compute_network.vpc_network.self_link
    subnetwork = google_compute_subnetwork.subnet_network.self_link

    access_config {                               # it gives public ip 
      // Ephemeral IP (Optional)
    }
  }

  #metadata_startup_script = <<-EOF
  #  #!/bin/bash
  #  echo 'Hello, World!' > /var/www/html/index.html
  #  nohup python -m SimpleHTTPServer 8080 &
  #xlEOF

  tags = ["webserver"]
}

# creating the firewall

resource "google_compute_firewall" "rules" {
  project     = var.gcp_project
  name        = var.gcp_firewall
  network     = google_compute_network.vpc_network.self_link
  description = "Creates firewall rule targeting tagged instances"
  source_ranges = ["0.0.0.0/0"]


  allow {
    protocol  = "tcp"
    ports     = ["22"]
  }
}


# creating the persistent disk 

resource "google_compute_disk" "my_blank_disk" {
  name  = var.gcp_disk
  size  = var.gcp_disksize  # Specify the size of the disk in GB
  type  = var.gcp_listdisk[0]   # Specify the type of disk (pd-ssd or pd-standard)
}


# attaching the disk to vm

resource "google_compute_attached_disk" "new_disk" {
  disk     = google_compute_disk.my_blank_disk.id
  instance = google_compute_instance.vm.id
}