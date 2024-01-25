provider "google" {
  credentials = file("aitorch-projects-75092660058d.json")     # enter the file name what created in iam (service account)
  project     = var.gcp_project                            # project id
  region      = var.gcp_regions[0]  # Change to your desired region
  zone        = var.gcp_az
}