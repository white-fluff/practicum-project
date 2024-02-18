terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"

  backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    bucket     = "momo-store-terraform-state-std-15-39"
    region     = "ru-central1"
    key        = "momo_terraform.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
  }
}

provider "yandex" {
  token     = var.iam_token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}

module "s3-bucket" {
  source = "./modules/s3-bucket"
  sa_access_key = var.sa_access_key
  sa_secret_key = var.sa_secret_key
}

module "k8s-cluster" {
  source         = "./modules/k8s-cluster"
  default_zone   = var.zone
  folder_id      = var.folder_id
}