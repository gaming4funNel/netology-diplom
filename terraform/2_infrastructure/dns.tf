resource "yandex_dns_zone" "gaming4funnet" {
  name        = "gaming4funnet"
  description = "Публичная зона для домена gaming4funnet.ru"

  zone             = "gaming4funnet.ru."
  public           = true
  private_networks = [yandex_vpc_network.network.id]
}

resource "yandex_dns_recordset" "domain" {
  zone_id = yandex_dns_zone.gaming4funnet.id
  name    = "@"
  type    = "A"
  ttl     = 60
  data    = ["84.252.132.211"]
}

resource "yandex_dns_recordset" "app" {
  zone_id = yandex_dns_zone.gaming4funnet.id
  name    = "app"
  type    = "A"
  ttl     = 60
  data    = ["84.252.132.212"]
}

resource "yandex_dns_recordset" "grafana" {
  zone_id = yandex_dns_zone.gaming4funnet.id
  name    = "grafana"
  type    = "A"
  ttl     = 60
  data    = ["84.252.132.213"]
}