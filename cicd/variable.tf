variable "gcp_regions" {
  description = "A list of valid Google Cloud regions."
  type        = list(string)
  default     = ["us-central1", "us-east1", "europe-west1", "asia-southeast1", "asia-south1"]
}


variable "gcp_project" {
  description = "select the project id."
  default     = "aitorch-projects"
}

variable "gcp_az" {
  description = "selecting the az."
  default     = "us-central1-a"
}