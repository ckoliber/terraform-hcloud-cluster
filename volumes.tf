resource "hcloud_volume" "this" {
  for_each = var.volumes

  name              = coalesce(each.value.name, "${var.name}-${each.key}")
  size              = each.value.size
  labels            = each.value.labels
  format            = each.value.format
  location          = each.value.location
  delete_protection = each.value.protection
}
