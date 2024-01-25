variable "machine_type" {
  description = "The machine type for virtual machines (e.g., n1-standard-1)."
  default     = "e2-medium"
}

variable "machine_name" {
  description = "The machine name of vm."
  default     = "somasekar"
}

variable "gcp_regions" {
  description = "A list of valid Google Cloud regions."
  type        = list(string)
  default     = ["us-central1", "us-east1", "europe-west1", "asia-southeast1", "asia-south1"]
}

variable "gcp_az" {
  description = "selecting the az."
  default     = "us-central1-a"
}

variable "gcp_firewall" {
  description = "selecting the name of firewall."
  default     = "new-firewall"
}

variable "gcp_project" {
  description = "select the project id."
  default     = "aitorch-projects"
}


variable "gcp_disk" {
  description = "select the project id."
  default     = "soma-disk"
}

variable "gcp_disksize" {
  description = "select the project id."
  default     = "100"
}

#variable "gcp_deletion" {
#  description = "select the project id."
#  type        = bool
#  default     = True
#}

variable "gcp_listdisk" {
  description = "A list of valid Google Cloud regions."
  type        = list(string)
  default     = ["pd-standard", "pd-ssd"]  #list of disk
}


