variable "iam_token" {
  description = "Cloud ID in Y.Cloud"
  type        = string
}

variable "cloud_id" {
  description = "Cloud ID in Y.Cloud"
  type        = string
  default     = "b1g02u7oe05n4bt41qpi"
}

variable "folder_id" {
  description = "Folder ID in Cloud"
  type        = string
  default     = "b1glhqnn7s5p63026qgk"
}

variable "zone" {
  description = "Yandex.Cloud resources availability zones"
  type        = string
  default     = "ru-central1-b"
}

variable "iac-manager-sa_id" {
  description = "Service Account ID"
  type        = string
  default     = "aje6oo4ea4vtbh4388da"
}

variable "sa_access_key" {
  description = "Service Account access_key"
  type        = string
  default     = ""
}

variable "sa_secret_key" {
  description = "Service Account secret_key"
  type        = string
  default     = ""
}