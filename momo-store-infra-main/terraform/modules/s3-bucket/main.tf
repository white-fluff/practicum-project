locals {
  bucket_name = "momo-resources-bucket-std-15-39"
}

terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

resource "yandex_storage_bucket" "momo-resources-bucket-std-15-39" {
  access_key = var.sa_access_key
  secret_key = var.sa_secret_key
  bucket     = local.bucket_name

  acl        = "public-read"
}

resource "yandex_storage_object" "images-objects" {
  count      = length(tolist(fileset("${path.module}/images", "**")))
  access_key = var.sa_access_key
  secret_key = var.sa_secret_key
  bucket     = yandex_storage_bucket.momo-resources-bucket-std-15-39.bucket
  key        = tolist(fileset("${path.module}/images", "**"))[count.index]
  source     = "${path.module}/images/${tolist(fileset("${path.module}/images", "**"))[count.index]}"
}
