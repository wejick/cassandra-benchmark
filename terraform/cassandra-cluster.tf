provider "google" {
  credentials = "${file("search-235609-874d7bd33a47.json")}"
  project     = "search-235609"
  region      = "asia-southeast1"
  zone        = "asia-southeast1-b"
}

resource "google_compute_instance" "cassandra_instance_seed" {
  name         = "cassandra-instance-seed"
  machine_type = "n1-standard-1"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
    auto_delete = true
  }

  metadata_startup_script = "${file("prepared-disk-ext4.sh")}"

  scratch_disk {
    interface = "NVME"
  }

  network_interface {
    # A default network is created for all GCP projects
    network       = "default"
    access_config = {
    }
  }
}

# resource "google_compute_instance" "cassandra_instance_node" {
#   name         = "cassandra-instance-node"
#   machine_type = "n1-standard-1"

#   boot_disk {
#     initialize_params {
#       image = "debian-cloud/debian-9"
#     }
#     auto_delete = true
#   }

#   scratch_disk {
#     interface = "NVME"
#   }

#   network_interface {
#     # A default network is created for all GCP projects
#     # network       = "${google_compute_network.cassandra_network.self_link}"
#     network = "default"
#     access_config = {
#     }
#   }
# }

# resource "google_compute_network" "cassandra_network" {
#   name                    = "cassandra-network"
#   auto_create_subnetworks = "true"
# }
